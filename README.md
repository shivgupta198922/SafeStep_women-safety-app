# SafeStep - Women Safety App (Guardian Angel)

## Overview
SafeStep is a comprehensive women safety mobile app built with Flutter (cross-platform) and Node.js/Express/MongoDB backend. Features real-time SOS alerts, live location sharing, fake calls, shake-to-alert, AI activity monitoring, emergency contacts, safe journey tracking, Rakshak mode, and more.

## Features
### Frontend (Flutter)
- **SOS Panic Button & Shake SOS**: Instant alerts with location, photo/video evidence.
- **Live Tracking & Share Live**: Real-time GPS sharing with guardians.
- **Fake Call**: Emergency fake incoming call screen.
- **Safe Journey**: Auto-alert if deviation/stop.
- **Rakshak Mode**: Guardian dashboard for monitoring.
- **Activity Detection**: AI/ML detects falls/unusual activity.
- **Emergency Contacts**: Quick SMS/Call + auto-alerts.
- **Protection Timer, Helpline Directory, Safety Tips, Women Council**.
- FCM push notifications, background service.

### Backend (Node.js/Express/MongoDB)
- User auth (JWT).
- SOS alerts, live locations, evidence upload.
- Journeys, activity logs, concerns reporting.
- Socket.io for real-time.

## Tech Stack
- **Frontend**: Flutter 3.x, Geolocator, Camera, Sensors+, Firebase Messaging, Google Maps, TensorFlow Lite (AI).
- **Backend**: Node.js, Express, Mongoose, Socket.io, Multer (media), FCM.
- Database: MongoDB.

## Quick Setup
### Backend
```
cd guardian_angel_backend
npm install
npm start
```

### Frontend
```
cd guardian_angel_flutter
flutter pub get
flutter run
```

See [COMPLETE_SETUP_GUIDE.md](COMPLETE_SETUP_GUIDE.md), [BACKEND_INTEGRATION.md](BACKEND_INTEGRATION.md).

## Screenshots/Demo
See [PROJECT_COMPLETION_SUMMARY.md](PROJECT_COMPLETION_SUMMARY.md).

## License
MIT
