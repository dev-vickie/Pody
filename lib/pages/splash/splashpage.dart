import 'package:flutter/material.dart';
import '../onbording_pages/onboarding_main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController fadeController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
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
            builder: (context) => const OnboardingScreen(),
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
