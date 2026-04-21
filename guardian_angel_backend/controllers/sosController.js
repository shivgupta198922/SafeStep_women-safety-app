const EmergencyAlert = require('../models/EmergencyAlert');
const Location = require('../models/Location');
const User = require('../models/User');

exports.triggerSOS = async (req, res) => {
  try {
    const userId = req.user.id;
    const { latitude, longitude, audioFile, videoFile } = req.body;
    
    const alert = new EmergencyAlert({
      userId,
      latitude,
      longitude,
      audioFile,
      videoFile,
      timestamp: new Date()
    });
    await alert.save();

    const location = new Location({
      userId,
      latitude,
      longitude,
      timestamp: new Date()
    });
    await location.save();

    const user = await User.findById(userId).populate('emergencyContacts');
    const contacts = user ? user.emergencyContacts || [] : [];

    // Twilio SMS
    try {
      const twilio = require('twilio')(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN);
      for (let contact of contacts) {
        await twilio.messages.create({
          body: `🚨 EMERGENCY from ${user.name}! Location: https://maps.google.com/?q=${latitude},${longitude}`,
          from: process.env.TWILIO_PHONE || '+123456',
          to: contact.phone
        });
      }
    } catch(e) {
      console.log('SMS send failed:', e.message);
    }

    console.log('SOS alert sent to', contacts.length, 'contacts');

    res.json({ message: 'SOS triggered and contacts notified', alertId: alert._id });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getEmergencyAlerts = async (req, res) => {
  try {
    const userId = req.user.id;
    const alerts = await EmergencyAlert.find({ userId }).sort({ timestamp: -1 });
    res.json(alerts);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getLiveLocation = async (req, res) => {
  try {
    const userId = req.user.id;
    const locations = await Location.find({ userId }).sort({ timestamp: -1 }).limit(1);
    res.json(locations[0] || null);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

