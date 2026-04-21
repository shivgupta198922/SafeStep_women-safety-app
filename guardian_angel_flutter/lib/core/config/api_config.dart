/// API Configuration for Guardian Angel Backend
/// This file contains all backend URLs and API endpoints

class ApiConfig {
  // ============= BACKEND CONFIGURATION =============
  
  // Change this to your backend server URL
  // For development: http://192.168.x.x:5000 or http://localhost:5000
  // For production: https://your-production-url.com
static const String baseUrl = 'http://10.0.2.2:5000'; // Fixed: Android emulator (host localhost), localhost for web, LAN IP for physical device
  static const String apiPath = '/api';
  static const String fullApiUrl = '$baseUrl$apiPath';

  // Socket.IO Configuration
  static const String socketUrl = baseUrl;
  static const int socketTimeout = 5000; // milliseconds
  
  // ============= AUTH ENDPOINTS =============
  static const String loginEndpoint = '$fullApiUrl/auth/login';
  static const String signupEndpoint = '$fullApiUrl/auth/signup';
  static const String forgotPasswordEndpoint = '$fullApiUrl/auth/forgot-password';
  static const String sendOtpSmsEndpoint = '$fullApiUrl/auth/send-otp-sms';
  static const String sendOtpEmailEndpoint = '$fullApiUrl/auth/send-otp-email';
  static const String verifyOtpEndpoint = '$fullApiUrl/auth/verify-otp';
  static const String resetPasswordEndpoint = '$fullApiUrl/auth/reset-password';

  // ============= SOS ENDPOINTS =============
  static const String sosTrigerEndpoint = '$fullApiUrl/sos/trigger';
  static const String sosAlertsEndpoint = '$fullApiUrl/sos/alerts';
  static const String sosLiveLocationEndpoint = '$fullApiUrl/sos/live-location';

  // ============= LOCATION ENDPOINTS =============
  static const String locationSaveEndpoint = '$fullApiUrl/location/save';
  static const String locationHistoryEndpoint = '$fullApiUrl/location/history';

  // ============= CONTACTS ENDPOINTS =============
  static const String contactsAddEndpoint = '$fullApiUrl/contacts';
  static const String contactsListEndpoint = '$fullApiUrl/contacts';
  static const String contactsUpdateEndpoint = '$fullApiUrl/contacts/:id';
  static const String contactsDeleteEndpoint = '$fullApiUrl/contacts/:id';

  // ============= JOURNEY ENDPOINTS =============
  static const String journeyCreateEndpoint = '$fullApiUrl/journey';
  static const String journeyListEndpoint = '$fullApiUrl/journey';
  static const String journeyStartEndpoint = '$fullApiUrl/journey/:id/start';
  static const String journeyCompleteEndpoint = '$fullApiUrl/journey/:id/complete';

  // ============= ACTIVITY ENDPOINTS =============
  static const String activityLogEndpoint = '$fullApiUrl/activity/log';
  static const String activityHistoryEndpoint = '$fullApiUrl/activity/history';

  // ============= EVIDENCE ENDPOINTS =============
  static const String evidenceUploadEndpoint = '$fullApiUrl/evidence/upload';
  static const String evidenceListEndpoint = '$fullApiUrl/evidence';

  // ============= CONCERNS ENDPOINTS =============
  static const String concernsCreateEndpoint = '$fullApiUrl/concerns/create';
  static const String concernsListEndpoint = '$fullApiUrl/concerns/list';
  static const String concernsGetEndpoint = '$fullApiUrl/concerns/:concernId';
  static const String concernsUpdateEndpoint = '$fullApiUrl/concerns/:concernId/status';
  static const String concernsDeleteEndpoint = '$fullApiUrl/concerns/:concernId';

  // ============= TIMER ENDPOINTS =============
  static const String timerStartEndpoint = '$fullApiUrl/timer/start';
  static const String timerListEndpoint = '$fullApiUrl/timer/list';
  static const String timerStatusEndpoint = '$fullApiUrl/timer/status/:timerId';
  static const String timerCancelEndpoint = '$fullApiUrl/timer/cancel/:timerId';

  // ============= CONTACT SMS/CALL ENDPOINTS =============
  static const String contactSendSmsEndpoint = '$fullApiUrl/contacts/sms/send';
  static const String contactMakeCallEndpoint = '$fullApiUrl/contacts/call/make';

  // ============= HEALTH CHECK =============
  static const String healthCheckEndpoint = '$baseUrl/health';

  // ============= CONFIGURATION CONSTANTS =============
  static const int requestTimeoutMs = 30000; // 30 seconds
  static const int maxRetries = 3;
  
  /// Get JWT Token Header
  static Map<String, String> getAuthHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  /// Get Headers without Token
  static Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  /// Check if server is reachable (Health Check)
  static Future<bool> isServerReachable() async {
    try {
      Uri.parse(healthCheckEndpoint).resolve('/health').toString();
      return true;
    } catch (e) {
      return false;
    }
  }
}
