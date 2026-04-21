import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Follow Me Feature Screen - Real-time Journey Tracking
class FollowMeScreen extends StatefulWidget {
  const FollowMeScreen({super.key});

  @override
  State<FollowMeScreen> createState() => _FollowMeScreenState();
}

class _FollowMeScreenState extends State<FollowMeScreen> {
  bool _isFollowMeActive = false;
  final List<String> _sharedWith = ['Mom', 'Dad', 'Shruti', 'Office Security'];
  final List<Map<String, String>> _journeyStops = [
    {'name': 'Home', 'time': '08:00 AM', 'status': '✓ Reached'},
    {'name': 'Coffee Shop', 'time': '08:30 AM', 'status': '✓ Reached'},
    {'name': 'Office Building', 'time': '09:15 AM', 'status': '✓ Reached'},
    {'name': 'Lunch Spot', 'time': '01:00 PM', 'status': '🔄 In Transit'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow Me - Live Journey'),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Status Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '📍',
                        style: TextStyle(fontSize: 48),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Follow Me',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Share your live journey with trusted contacts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Status Container
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isFollowMeActive
                              ? Colors.green[50]
                              : Colors.orange[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _isFollowMeActive
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              _isFollowMeActive ? '🟢' : '🟠',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _isFollowMeActive
                                        ? 'Journey Tracking Active'
                                        : 'Start a Journey',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: _isFollowMeActive
                                          ? Colors.green
                                          : Colors.orange,
                                    ),
                                  ),
                                  Text(
                                    _isFollowMeActive
                                        ? 'Shared with ${_sharedWith.length} people'
                                        : 'Keep contacts updated on your journey',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Toggle Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFollowMeActive = !_isFollowMeActive;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isFollowMeActive
                                    ? '✅ Journey tracking enabled!'
                                    : '⏹️ Journey tracking stopped',
                              ),
                              backgroundColor: _isFollowMeActive
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: _isFollowMeActive
                                ? Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            _isFollowMeActive
                                ? 'Stop Journey'
                                : 'Start Journey',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (_isFollowMeActive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shared With
                      const Text(
                        'Shared With:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _sharedWith.map((contact) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  contact,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '✓ Stopped sharing with $contact',
                                        ),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      // Journey Timeline
                      const Text(
                        'Journey Timeline:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._journeyStops.map((stop) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                color: AppTheme.primaryPink,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stop['name'] ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      stop['time'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                stop['status'] ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
