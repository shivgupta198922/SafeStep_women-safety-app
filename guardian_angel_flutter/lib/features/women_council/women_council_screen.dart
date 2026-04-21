import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Women Council Access Feature Screen
class WomenCouncilScreen extends StatefulWidget {
  const WomenCouncilScreen({super.key});

  @override
  State<WomenCouncilScreen> createState() => _WomenCouncilScreenState();
}

class _WomenCouncilScreenState extends State<WomenCouncilScreen> {
  final List<Map<String, String>> _councilMembers = [
    {
      'name': 'Dr. Priya Sharma',
      'role': 'Founder & Women Rights Advocate',
      'bio': '20+ years in women\'s safety advocacy',
      'icon': '👩‍⚖️'
    },
    {
      'name': 'Anjali Dutta',
      'role': 'Legal Expert & Counselor',
      'bio': 'Expert in women protection laws',
      'icon': '⚖️'
    },
    {
      'name': 'Neha Mishra',
      'role': 'Safety Training Specialist',
      'bio': 'Self-defense and safety training expert',
      'icon': '🥋'
    },
    {
      'name': 'Meera Singh',
      'role': 'Digital Security Expert',
      'bio': 'Cybersecurity and online safety consultant',
      'icon': '💻'
    },
  ];

  final List<Map<String, String>> _resources = [
    {
      'title': 'Women\'s Rights Information',
      'icon': '📚',
      'description': 'Know your legal rights and protections'
    },
    {
      'title': 'Safety Guides',
      'icon': '🛡️',
      'description': 'Comprehensive safety guidelines'
    },
    {
      'title': 'Support Groups',
      'icon': '👥',
      'description': 'Connect with support communities'
    },
    {
      'title': 'Legal Resources',
      'icon': '⚖️',
      'description': 'Access legal assistance'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Council'),
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
                    '👩‍⚖️',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Women Council',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Empowering women through guidance & resources',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Council Members:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ..._councilMembers.map((member) {
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
                          member['icon'] ?? '',
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                member['name'] ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                member['role'] ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.primaryPink,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      member['bio'] ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '📧 Message sent to ${member['name']}',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryPink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Ask Advice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            const Text(
              'Resources &  Support:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ..._resources.map((resource) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      resource['icon'] ?? '',
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resource['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            resource['description'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
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
