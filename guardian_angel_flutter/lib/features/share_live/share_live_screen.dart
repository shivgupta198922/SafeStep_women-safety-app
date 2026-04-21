import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Share Live Info Feature Screen
class ShareLiveInfoScreen extends StatefulWidget {
  const ShareLiveInfoScreen({super.key});

  @override
  State<ShareLiveInfoScreen> createState() => _ShareLiveInfoScreenState();
}

class _ShareLiveInfoScreenState extends State<ShareLiveInfoScreen> {
  bool _isSharingActive = false;
  int _sharingDurationMinutes = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Live Info'),
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
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '📍',
                        style: TextStyle(fontSize: 48),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Share Live Location',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Share your real-time location with trusted contacts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Sharing Status
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isSharingActive
                              ? Colors.green[50]
                              : Colors.orange[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _isSharingActive
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              _isSharingActive ? '🟢' : '🟠',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _isSharingActive
                                      ? 'Sharing Active'
                                      : 'Not Sharing',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _isSharingActive
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                                Text(
                                  _isSharingActive
                                      ? 'Remaining: $_sharingDurationMinutes min'
                                      : 'Enable to share location',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Duration Selection
                      const Text(
                        'Select Sharing Duration:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          _durationOption(15, '15 Minutes'),
                          const SizedBox(height: 12),
                          _durationOption(30, '30 Minutes (Recommended)'),
                          const SizedBox(height: 12),
                          _durationOption(60, '1 Hour'),
                          const SizedBox(height: 12),
                          _durationOption(120, '2 Hours'),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Toggle Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSharingActive = !_isSharingActive;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isSharingActive
                                    ? '✅ Location sharing enabled!'
                                    : '❌ Location sharing disabled',
                              ),
                              backgroundColor: _isSharingActive
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: _isSharingActive
                                ? Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            _isSharingActive ? 'Stop Sharing' : 'Start Sharing',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _durationOption(int duration, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _sharingDurationMinutes = duration;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _sharingDurationMinutes == duration
              ? AppTheme.primaryPink
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              _sharingDurationMinutes == duration ? '✓' : '○',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _sharingDurationMinutes == duration
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: _sharingDurationMinutes == duration
                    ? Colors.white
                    : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
