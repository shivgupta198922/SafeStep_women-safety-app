import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Emergency Helpline Directory Feature Screen
class HelpdireTy extends StatelessWidget {
  const HelpdireTy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> helplines = [
      {
        'name': 'National Emergency',
        'number': '100 / 112',
        'type': 'Police & Emergency',
        'icon': '🚨'
      },
      {
        'name': 'Women Helpline',
        'number': '1091',
        'type': 'Women\'s Safety',
        'icon': '👩'
      },
      {
        'name': 'Domestic Violence Helpline',
        'number': '+91-7827992311',
        'type': 'Domestic Help',
        'icon': '🛡️'
      },
      {
        'name': 'Childline India',
        'number': '1098',
        'type': 'Child Safety',
        'icon': '👶'
      },
      {
        'name': 'Sexual Harassment Helpline',
        'number': '+91-8010202020',
        'type': 'POSH Support',
        'icon': '💪'
      },
      {
        'name': 'Cyber Crime Cell',
        'number': '1930',
        'type': 'Cyber Help',
        'icon': '💻'
      },
      {
        'name': 'Mental Health Support',
        'number': '+91-9820466726',
        'type': 'Mental Health',
        'icon': '🧘'
      },
      {
        'name': 'Medical Emergency',
        'number': '108 / 102',
        'type': 'Ambulance Service',
        'icon': '🚑'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Helpline Directory'),
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
                    '📞',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Emergency Helplines',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Quick access to emergency services and support',
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
            ...helplines.map((helpline) {
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
                child: Row(
                  children: [
                    Text(
                      helpline['icon'] ?? '',
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            helpline['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            helpline['type'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            helpline['number'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '📞 Calling ${helpline['number']}...',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text('📋 Number copied to clipboard'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.content_copy,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
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
