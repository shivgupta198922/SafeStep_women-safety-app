# SafeStep - Women Safety App

## Overview
SafeStep (Guardian Angel) is a comprehensive women safety mobile application built with Flutter (cross-platform) and Node.js backend. It provides real-time safety features including SOS alerts, live location sharing, fake calls, activity monitoring, emergency contacts, and more.

## Key Features
- **SOS/Panic Button**: Instant alerts with location, audio/video evidence collection.
- **Live Tracking/Share Location**: Real-time GPS sharing with guardians/contacts.
- **Fake Call**: Emergency fake incoming call to escape situations.
- **Shake-to-Activate SOS**: Hardware shake gesture trigger.
- **Safe Journey Mode**: Auto-alert if journey deviates or takes too long.
- **Activity Detection**: Monitors walking/running patterns.
- **Emergency Contacts**: Quick dial/SMS to predefined contacts.
- **Rakshak Mode**: Guardian mode for monitoring others.
- **Evidence Recording**: Auto-record audio/video during SOS.
- **Backend API**: User auth, location tracking, alerts, concerns logging.
- **Push Notifications**: FCM integration.
- **AI Analysis**: Basic anomaly detection.

## Tech Stack
- **Frontend**: Flutter/Dart, Google Maps, Camera, Sensors, Permissions.
- **Backend**: Node.js/Express, MongoDB (Mongoose models), Socket.io.
- **Services**: FCM, Geolocator, Background services.

## Project Structure
```
.
├── guardian_angel_flutter/     # Flutter app
│   ├── lib/                    # Dart source
│   ├── android/                # Android config
│   ├── pubspec.yaml
│   └── ...
├── guardian_angel_backend/     # Node.js API
│   ├── models/                 # Mongoose schemas
│   ├── controllers/
│   ├── routes/
│   ├── server.js
│   └── package.json
├── README.md
├── SETUP_GUIDE.md
└── ...
```

## Quick Start
See [COMPLETE_SETUP_GUIDE.md](COMPLETE_SETUP_GUIDE.md), [QUICK_START.md](QUICK_START.md)

## Screenshots/Demo
(Coming soon)

## License
MIT
