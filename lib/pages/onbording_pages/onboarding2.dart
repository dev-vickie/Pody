import 'package:flutter/material.dart';
import 'package:podcast_app/widgets/onboarding-widgets/onboarding_widgets.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingItem(
      onboardingMessage: 'We host experienced devs to elevate your career',
      lottieAssetLink: 'assets/flutter2.json',
    );
  }
}
