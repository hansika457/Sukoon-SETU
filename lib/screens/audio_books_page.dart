import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/audio_books_detail_page.dart';
import 'package:sukoon_setu/screens/meditation_page.dart';
import 'package:sukoon_setu/screens/sound_beats_page.dart';
import 'package:sukoon_setu/screens/yoga_page.dart';

class AudioBooksPage extends StatelessWidget {
  const AudioBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final audioBooks = [
      {
        'title': 'AUDIOBOOKS',
        'icon': Icons.library_books, // Represents books and reading
      },
      {
        'title': 'YOGA',
        'icon': Icons.self_improvement, // Calm person in yoga pose
      },
      {
        'title': 'MEDITATION',
        'icon': Icons.spa, // Peace, wellness, relaxation
      },
      {
        'title': 'SOUNDBEATS',
        'icon': Icons.graphic_eq, // Audio visualizer / sound waves
      },
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Audio Books',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: audioBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final book = audioBooks[index];

            void navigateToDetail() {
              Widget page;

              switch (index) {
                case 0:
                  page =  AudioBooksDetailPage();
                  break;
                case 1:
                  page =  YogaPage();
                  break;
                case 2:
                  page =  MeditationPage();
                  break;
                case 3:
                  page =  SoundBeatsPage();
                  break;
                default:
                  return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }

            return GestureDetector(
              onTap: navigateToDetail,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 1.2,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      book['icon'] as IconData,
                      size: 48,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      book["title"] as String,
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
