import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/about_us.dart';
import 'package:sukoon_setu/screens/audio_books_page.dart';
import 'package:sukoon_setu/screens/breathing_techniques_page.dart';
import 'package:sukoon_setu/screens/chat_page.dart';
import 'package:sukoon_setu/screens/profile_page.dart';
import 'package:sukoon_setu/screens/quiz_screen.dart';
import 'package:sukoon_setu/screens/understand_common_conditions_page.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const HomeScreen({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeContentPage(onLocaleChange: widget.onLocaleChange),
      ChatScreen(onLocaleChange: widget.onLocaleChange),
      AboutUsScreen(),
      ProfilePage(onLocaleChange: widget.onLocaleChange),
    ];

    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context); 

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: theme.colorScheme.surface, // instead of Colors.white
        selectedItemColor: theme.primaryColor, // instead of Color(0xFFff6e40)
        unselectedItemColor:
            Colors.grey.shade600, // can keep grey here or add to AppColors
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations.homeLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: localizations.adviceLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_rounded),
            label: localizations.aboutUs,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: localizations.profileLabel,
          ),
        ],
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  HomeContentPage({super.key, required this.onLocaleChange});

  final userInfo = UserInfo(
    name: '',
    age: 0,
    gender: '',
    profession: '',
    area: '',
  );

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.greeting,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor, // instead of Colors.deepOrange
            ),
          ),
          Text(
            localizations.howWasYourDay,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              color: theme
                  .textTheme
                  .bodyLarge!
                  .color, // usually primary text color
            ),
          ),
          const SizedBox(height: 30),
          Text(
            localizations.services,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor, // instead of Colors.deepOrange
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildServiceCard(
                localizations.breathingTechniques,
                Icons.air_rounded,
                theme,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BreathingTechniquesPage()),
                ),
              ),
              _buildServiceCard(
                localizations.adviceFromSetu,
                Icons.medication_liquid,
                theme,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(onLocaleChange: onLocaleChange),
                  ),
                ),
              ),
              _buildServiceCard(
                localizations.audioBooksStories,
                Icons.menu_book,
                theme,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AudioBooksPage()
                  ),
                ),
              ),
              _buildServiceCard(
                localizations.commonMentalHealth,
                Icons.psychology,
                theme,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UnderstandCommonConditions(
                      onLocaleSelected: onLocaleChange,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            // height: 150, // <-- now Expanded will work
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.primaryColor, theme.primaryColor],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.thought,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    localizations.thoughtOfTheDay,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    IconData icon,
    ThemeData theme,
    VoidCallback onTap,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: theme.primaryColor),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}