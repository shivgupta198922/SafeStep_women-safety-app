# Backend and Frontend Diagnosis - Why Not Working

## Backend Issues
- **Missing Core Files**: guardian_angel_backend/ lacks `package.json`, `server.js`, most controllers/routes/models. Only `controllers/sosController.js`, `routes/contacts.js` exist.
- **Cannot Start**: No npm install/start possible without package.json.
- **Expected Port**: 5000 (per api_config.dart).

## Frontend Issues
- **Missing pubspec.yaml**: Prevents `flutter pub get`/build.
- **Partial Services**: api_service.dart etc. missing despite structure.
- **API Config**: http://10.0.2.2:5000 (emulator); change for physical/LAN IP.

## Quick Fixes

### Backend Minimal Recreation
**guardian_angel_backend/package.json**:
```
{
  \"name\": \"guardian-angel-backend\",
  \"version\": \"1.0.0\",
  \"main\": \"server.js\",
  \"scripts\": {
    \"start\": \"node server.js\",
    \"dev\": \"nodemon server.js\"
  },
  \"dependencies\": {
    \"express\": \"^4.19.2\",
    \"cors\": \"^2.8.5\",
    \"mongoose\": \"^8.3.1\",
    \"socket.io\": \"^4.7.5\",
    \"jsonwebtoken\": \"^9.0.2\",
    \"bcryptjs\": \"^2.4.3\",
    \"multer\": \"^1.4.5-lts.1\",
    \"twilio\": \"^5.0.4\",
    \"dotenv\": \"^16.4.5\"
  }
}
```

**guardian_angel_backend/server.js**:
```
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors({origin: '*'}));
app.use(express.json());

app.get('/health', (req, res) => res.json({status: 'OK', port: 5000}));

// TODO: Add routes after files restored
// app.use('/api/auth', require('./routes/auth'));
// etc.

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
```

Run:
```
cd guardian_angel_backend
npm install
npm start
```

### Frontend
Ensure `pubspec.yaml` exists (standard Flutter + deps: dio, geolocator, camera, sensors_plus, firebase_messaging, etc.).

```
cd guardian_angel_flutter
flutter clean
flutter pub get
flutter run
```

## Verification
- Backend: Visit http://localhost:5000/health
- Frontend: Check logs for API connection.

## Full Restore
Repo: https://github.com/shivgupta198922/SafeStep_women-safety-app.git
```
git pull origin main
```

Updated: $(date)
