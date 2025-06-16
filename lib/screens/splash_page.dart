import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/home_page.dart';
import 'package:sukoon_setu/screens/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) onLocaleSelected;
  const SplashScreen({super.key, required this.onLocaleSelected});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
void initState() {
  super.initState();
  _checkAuthStatus();
}

  void _checkAuthStatus() async {
  await Future.delayed(const Duration(seconds: 2)); // show splash for 2 seconds

  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // User is already logged in
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(onLocaleChange: widget.onLocaleSelected,),
      ),
    );
  } else {
    // User is not logged in, go to welcome screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(onLocaleSelected: widget.onLocaleSelected),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.self_improvement,
                    size: 80,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'SukoonSetu',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
