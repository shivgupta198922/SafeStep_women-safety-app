
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/services/permission_service.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/sos/sos_activated_screen.dart';
import 'features/panic_mode/panic_mode_screen.dart';
import 'features/safe_journey/safe_journey_screen.dart';
import 'features/emergency_contacts/emergency_contacts_screen.dart';
// Enhanced home screen and all feature screens
import 'features/home_dashboard/enhanced_home_screen.dart';
import 'features/fake_call/fake_call_screen.dart';
import 'features/record_help/record_help_screen.dart';
import 'features/share_live/share_live_screen.dart';
import 'features/rakshak/rakshak_mode_screen.dart';
import 'features/protection_timer/protection_timer_screen.dart';
import 'features/safety_tips/safety_tips_screen.dart';
import 'features/helpline/helpline_directory_screen.dart';
import 'features/follow_me/follow_me_screen.dart';
import 'features/raise_concern/raise_concern_screen.dart';
import 'features/women_council/women_council_screen.dart';
import 'features/safety_network/safety_network_screen.dart';
import 'features/activity_status/activity_status_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionService.initNotifications();
  runApp(const GuardianAngelApp());
}

class GuardianAngelApp extends StatelessWidget {
  const GuardianAngelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guardian Angel',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const EnhancedHomeScreen(),
        '/enhanced_home': (context) => const EnhancedHomeScreen(),
        '/sos_activated': (context) => const SOSActivatedScreen(),
        '/panic_mode': (context) => const PanicModeScreen(),
        '/safe_journey': (context) => const SafeJourneyScreen(),
        '/emergency_contacts': (context) => const EmergencyContactsScreen(),
        // New Feature Routes
        '/fake_call': (context) => const FakeCallScreen(),
        '/record_help': (context) => const RecordHelpScreen(),
        '/share_live': (context) => const ShareLiveInfoScreen(),
        '/rakshak': (context) => const RakshakModeScreen(),
        '/protection_timer': (context) => const ProtectionTimerScreen(),
        '/safety_tips': (context) => const SafetyTipsScreen(),
'/helpline': (context) => const HelplineDirectoryScreen(),
        '/follow_me': (context) => const FollowMeScreen(),
        '/raise_concern': (context) => const RaiseConcernScreen(),
        '/women_council': (context) => const WomenCouncilScreen(),
        '/safety_network': (context) => const SafetyNetworkScreen(),
        '/activity_status': (context) => const ActivityStatusScreen(),
      },
    );
  }
}
