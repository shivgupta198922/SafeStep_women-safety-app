const express = require('express');
const router = express.Router();
const contactController = require('../controllers/contactController');
const authenticateToken = require('../middleware/auth');

router.use(authenticateToken);

router.post('/', contactController.addContact);
router.get('/', contactController.getContacts);
router.put('/:id', contactController.updateContact);
router.delete('/:id', contactController.deleteContact);

// NEW: Send SMS with location
router.post('/sms/send', contactController.sendSmsWithLocation);

// NEW: Make call to contact
router.post('/call/make', contactController.makeCall);

module.exports = router;

