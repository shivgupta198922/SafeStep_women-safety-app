import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Women Safety Tips Feature Screen
class SafetyTipsScreen extends StatefulWidget {
  const SafetyTipsScreen({super.key});

  @override
  State<SafetyTipsScreen> createState() => _SafetyTipsScreenState();
}

class _SafetyTipsScreenState extends State<SafetyTipsScreen> {
  final List<Map<String, String>> _tips = [
    {
      'title': 'Trust Your Instincts',
      'icon': '🧠',
      'description':
          'If something feels wrong, it probably is. Don\'t ignore your gut feeling.',
    },
    {
      'title': 'Stay Visible & Connected',
      'icon': '📱',
      'description':
          'Keep your phone charged and tell someone where you\'re going.',
    },
    {
      'title': 'Travel in Groups',
      'icon': '👥',
      'description':
          'Whenever possible, travel with friends or family members.',
    },
    {
      'title': 'Be Aware of Your Surroundings',
      'icon': '👀',
      'description':
          'Always be aware of people and places around you. Avoid distractions.',
    },
    {
      'title': 'Use Well-lit Routes',
      'icon': '💡',
      'description':
          'Avoid dark alleys and isolated areas. Choose well-lit, populated routes.',
    },
    {
      'title': 'Share Your Location',
      'icon': '📍',
      'description':
          'Use Guardian Angel\'s share location feature with trusted contacts.',
    },
    {
      'title': 'Report Suspicious Activity',
      'icon': '⚠️',
      'description':
          'Don\'t hesitate to report suspicious behavior to authorities.',
    },
    {
      'title': 'Know Emergency Contacts',
      'icon': '📞',
      'description':
          'Keep important emergency numbers memorized and easily accessible.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Safety Tips'),
        backgroundColor: AppTheme.primaryPink,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    '💡',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Stay Safe & Empowered',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Expert-curated safety tips and guidelines',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ..._tips.map((tip) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          tip['icon'] ?? '',
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tip['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        tip['description'] ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
