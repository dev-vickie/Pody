import 'package:flutter/material.dart';
import 'package:podcast_app/pages/onbording_pages/onboarding_widgets.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingItem(
      onboardingMessage: 'Save podcasts to listen any time you want',
      lottieAssetLink: 'assets/flutter3.json',
    );
  }
}
