import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sukoon_setu/l10n/app_localizations.dart';

class BreathingTechniquesPage extends StatelessWidget {
  const BreathingTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final List<Map<String, dynamic>> techniques = [
      {
        'title': 'Anxiety & Worry',
        'description': localizations.breathingAnxietyWorry,
        'duration': 60,
        'icon': "assets/images/breathing_techniques/anxiety.jpeg",
      },
      {
        'title': 'Anger',
        'description': localizations.breathingAnger,
        'duration': 90,
        'icon': "assets/images/breathing_techniques/anger.jpeg",
      },
      {
        'title': 'Stress & Irritation',
        'description': localizations.breathingStressIrritation,
        'duration': 180,
        'icon': "assets/images/breathing_techniques/irritation.jpeg",
      },
      {
        'title': 'Sadness',
        'description': localizations.breathingSadness,
        'duration': 150,
        'icon': "assets/images/breathing_techniques/sadness.jpeg",
      },
      {
        'title': 'Calming',
        'description': localizations.breathingCalming,
        'duration': 90,
        'icon': "assets/images/breathing_techniques/calm.jpeg",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Breathing Techniques")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: techniques.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 4 / 4,
          ),
          itemBuilder: (context, index) {
            final item = techniques[index];

            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BreathingDetailPage(
                    title: item['title'],
                    description: item['description'],
                    duration: item['duration'],
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.colorScheme.primary),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image inside a circle container
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.15),
                        shape: BoxShape.circle,
                        // Optional shadow
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          item['icon'], // your image path here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BreathingDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final int duration; // in seconds

  const BreathingDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
  });

  @override
  State<BreathingDetailPage> createState() => _BreathingDetailPageState();
}

class _BreathingDetailPageState extends State<BreathingDetailPage> {
  late int remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingTime == 0) {
        t.cancel();
      } else {
        setState(() => remainingTime--);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CircularProgressIndicator(
                    value: (widget.duration - remainingTime) / widget.duration,
                    strokeWidth: 8,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    ),
                  ),
                ),
                Text(
                  '$remainingTime s',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.replay),
              label: const Text("Restart"),
              onPressed: () {
                setState(() {
                  remainingTime = widget.duration;
                  timer?.cancel();
                  timer = Timer.periodic(const Duration(seconds: 1), (t) {
                    if (remainingTime == 0) {
                      t.cancel();
                    } else {
                      setState(() => remainingTime--);
                    }
                  });
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
