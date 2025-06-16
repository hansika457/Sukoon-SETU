import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/utils/helper_functions.dart';

class YogaPage extends StatelessWidget {
  const YogaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YOGA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.primary, width: 1.2),
            ),
            leading: Icon(
              Icons.self_improvement,
              size: 32,
              color: theme.colorScheme.primary,
            ),
            title: const Text(
              "Relaxing Yoga Session",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Gentle yoga to calm your mind and body."),
            onTap: () => launchExternalUrl(localizations.yogaLink),
          ),
        ],
      ),
    );
  }
}
