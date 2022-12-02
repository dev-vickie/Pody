import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingItem extends StatelessWidget {
  final String onboardingMessage;
  final String lottieAssetLink;
  const OnboardingItem({
    super.key,
    required this.onboardingMessage,
    required this.lottieAssetLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              onboardingMessage,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Lottie.asset(
            lottieAssetLink,
            height: 350,
            width: 350,
          ),
        ],
      ),
    );
  }
}
