import 'package:flutter/material.dart';
import 'package:podcast_app/pages/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../onbording_pages/onboarding_main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController fadeController;

  late Animation animation;

  bool hideOnboarding = false;

  void isFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final res = prefs.getBool("hideOnboarding");
    if (res != null) {
      setState(() {
        hideOnboarding = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isFirstTime();
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(fadeController);
  }

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fadeController.repeat();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => hideOnboarding == true
                ? const HomePage()
                : const OnboardingScreen(),
          ),
        );
      },
    );
    return Container(
      color: Colors.blue[200],
      child: FadeTransition(
        opacity: fadeController,
        child: const Icon(
          Icons.mic,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
