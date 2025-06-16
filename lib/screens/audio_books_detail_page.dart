import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/utils/helper_functions.dart';

class AudioBooksDetailPage extends StatelessWidget {
  AudioBooksDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cardColor = theme.colorScheme.surface.withOpacity(0.9);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AUDIOBOOKS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AudioCard(
              title: localizations.audioBook1,
              url: localizations.audioBook1Link,
              icon: Icons.auto_stories,
              color: cardColor,
            ),
            const SizedBox(height: 16),
            AudioCard(
              title: localizations.audioBook2,
              url: localizations.audioBook2Link,
              icon: Icons.headset,
              color: cardColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AudioCard extends StatelessWidget {
  final String title;
  final String url;
  final IconData icon;
  final Color color;

  const AudioCard({
    super.key,
    required this.title,
    required this.url,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: color,
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
          child: Icon(icon, color: theme.colorScheme.primary),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.play_circle_fill,
            color: theme.colorScheme.primary,
            size: 32,
          ),
          onPressed: () => launchExternalUrl(url),
        ),
        onTap: () => launchExternalUrl(url),
      ),
    );
  }
}
