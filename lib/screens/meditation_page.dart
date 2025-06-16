import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/utils/helper_functions.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
      final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title:  Text("MEDITATION",          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.primary, width: 1.2),
            ),
            leading: Icon(Icons.nightlight_round, size: 32, color: theme.colorScheme.primary),
            title: const Text(
              "Guided Meditation",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Listen and relax with a guided session."),
            onTap: () => launchExternalUrl(localizations.meditationLink),
          ),
        ],
      ),
    );
  }
}
