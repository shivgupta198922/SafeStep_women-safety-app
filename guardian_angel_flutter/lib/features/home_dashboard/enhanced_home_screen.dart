import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Enhanced Home Screen with All 14-15 Features
class EnhancedHomeScreen extends StatefulWidget {
  const EnhancedHomeScreen({super.key});

  @override
  State<EnhancedHomeScreen> createState() => _EnhancedHomeScreenState();
}

class _EnhancedHomeScreenState extends State<EnhancedHomeScreen> {
  bool _isTrackingActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Guardian Angel',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Your Personal Safety',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _isTrackingActive
                                  ? Colors.green
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _isTrackingActive
                                  ? '🟢 Tracking ON'
                                  : '🟠 Tracking OFF',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SOS Emergency Button - Main Feature
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red[600],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'SOS',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'EMERGENCY',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'TAP TO ALERT',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('🚨 SOS Alert Triggered!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              'ALERT NOW',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Features Grid - All 14-15 Features
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Row 1: Core Features
                      _buildFeatureGrid([
                        _FeatureItem(
                          icon: '☎️',
                          title: 'Fake Call',
                          subtitle: 'Instant fake call',
                          onTap: () => _showFeature(context, 'Fake Call'),
                        ),
                        _FeatureItem(
                          icon: '🎙️',
                          title: 'Record',
                          subtitle: 'Record & Ask Help',
                          onTap: () => _showFeature(context, 'Record'),
                        ),
                        _FeatureItem(
                          icon: '📍',
                          title: 'Share Live',
                          subtitle: 'Share location',
                          onTap: () => _showFeature(context, 'Share Live'),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      // Row 2: Safety Features
                      _buildFeatureGrid([
                        _FeatureItem(
                          icon: '🏠',
                          title: 'Check-in',
                          subtitle: 'Go Private',
                          onTap: () => Navigator.pushNamed(context, '/safety_network'),
                        ),
                        _FeatureItem(
                          icon: '👥',
                          title: 'Safety Network',
                          subtitle: 'Your circle',
                          onTap: () => _showFeature(context, 'Safety Network'),
                        ),
                        _FeatureItem(
                          icon: '⏱️',
                          title: 'Timer',
                          subtitle: 'Protection timer',
                          onTap: () => _showFeature(context, 'Timer'),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      // Row 3: Community Features
                      _buildFeatureGrid([
                        _FeatureItem(
                          icon: '🦸',
                          title: 'Rakshak',
                          subtitle: 'Collective safety',
                          onTap: () => Navigator.pushNamed(context, '/rakshak'),
                        ),
                        _FeatureItem(
                          icon: '💡',
                          title: 'Safety Tips',
                          subtitle: 'Expert guidance',
                          onTap: () => _showFeature(context, 'Safety Tips'),
                        ),
                        _FeatureItem(
                          icon: '⚠️',
                          title: 'Raise Concern',
                          subtitle: 'Report issue',
                          onTap: () => _showFeature(context, 'Raise Concern'),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      // Row 4: Administrative Features
                      _buildFeatureGrid([
                        _FeatureItem(
                          icon: '👩‍⚖️',
                          title: 'Women Council',
                          subtitle: 'Access council',
                          onTap: () => _showFeature(context, 'Women Council'),
                        ),
                        _FeatureItem(
                          icon: '🆘',
                          title: 'Helpline',
                          subtitle: 'Emergency contacts',
                          onTap: () => _showFeature(context, 'Helpline Directory'),
                        ),
                        _FeatureItem(
                          icon: '📍',
                          title: 'Follow Me',
                          subtitle: 'Live journey',
                          onTap: () => _showFeature(context, 'Follow Me'),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      // Row 5: Status & Info
                      _buildFeatureGrid([
                        _FeatureItem(
                          icon: '🟢',
                          title: 'Volunteer',
                          subtitle: 'Go online/offline',
                          onTap: () => Navigator.pushNamed(context, '/activity_status'),
                        ),
                        _FeatureItem(
                          icon: '🎯',
                          title: 'Activity',
                          subtitle: 'Activity status',
                          onTap: () => _showFeature(context, 'Activity Status'),
                        ),
                        _FeatureItem(
                          icon: '📊',
                          title: 'Dashboard',
                          subtitle: 'View analytics',
                          onTap: () => _showFeature(context, 'Dashboard'),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(List<_FeatureItem> items) {
    return Row(
      children: items.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: item.onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    item.icon,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showFeature(BuildContext context, String featureName) {
    switch (featureName) {
      case 'Fake Call':
        Navigator.pushNamed(context, '/fake_call');
        break;
      case 'Record':
        Navigator.pushNamed(context, '/record_help');
        break;
      case 'Share Live':
        Navigator.pushNamed(context, '/share_live');
        break;
      case 'Safety Network':
        Navigator.pushNamed(context, '/safety_network');
        break;
      case 'Timer':
        Navigator.pushNamed(context, '/protection_timer');
        break;
      case 'Safety Tips':
        Navigator.pushNamed(context, '/safety_tips');
        break;
      case 'Raise Concern':
        Navigator.pushNamed(context, '/raise_concern');
        break;
      case 'Women Council':
        Navigator.pushNamed(context, '/women_council');
        break;
      case 'Helpline Directory':
        Navigator.pushNamed(context, '/helpline');
        break;
      case 'Follow Me':
        Navigator.pushNamed(context, '/follow_me');
        break;
      case 'Activity Status':
        Navigator.pushNamed(context, '/activity_status');
        break;
      case 'Dashboard':
        Navigator.pushNamed(context, '/activity_status');
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ $featureName feature activated!'),
            backgroundColor: AppTheme.accentGreen,
          ),
        );
    }
  }
}

class _FeatureItem {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
