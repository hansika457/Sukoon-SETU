import 'package:flutter/material.dart';
import 'package:sukoon_setu/utils/helper_functions.dart';

class SoundBeatsPage extends StatelessWidget {
  const SoundBeatsPage({super.key});

  final soundBeats = const [
    {
      'title': 'SleepEase',
      'url': 'https://www.youtube.com/watch?v=h4w9MMrVwUM',
      'icon': Icons.bedtime, // Sleep-related icon
    },
    {
      'title': 'CalmMind',
      'url':
          'https://www.youtube.com/watch?pp=ygUNI3NwYTMwbWludXRlcw%3D%3D&v=--vpwtieWQI',
      'icon': Icons.self_improvement, // Meditation / calmness icon
    },
    {
      'title': 'AngerRelease',
      'url': 'https://www.youtube.com/watch?pp=0gcJCdgAo7VqN5tD&v=de2TdvDaS5A',
      'icon': Icons.whatshot, // Fire / anger icon
    },
    {
      'title': 'SadnessEase',
      'url': 'https://www.youtube.com/watch?v=lHbutfjla8Q',
      'icon': Icons.water_drop, // Water / sadness icon
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SOUNDBEATS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: soundBeats.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final beat = soundBeats[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                  child: Icon(
                    beat['icon'] as IconData,
                    color: theme.colorScheme.primary,
                    size: 30,
                  ),
                ),
                title: Text(
                  beat['title'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: theme.colorScheme.primary,
                    size: 32,
                  ),
                  onPressed: () => launchExternalUrl(beat['url'] as String),
                ),
                onTap: () => launchExternalUrl(beat['url'] as String),
              ),
            );
          },
        ),
      ),
    );
  }
}
