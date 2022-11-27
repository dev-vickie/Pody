import 'package:flutter/material.dart';
import '../../widgets/onboarding-widgets/onboarding_widgets.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingItem(
      onboardingMessage: 'Amazing flutter podcasts every week!',
      lottieAssetLink: 'assets/flutter1.json',
    );
  }
}
