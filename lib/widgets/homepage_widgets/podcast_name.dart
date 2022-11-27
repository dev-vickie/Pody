import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodcastHeader extends StatelessWidget {
  const PodcastHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        "Amazing Flutter and Beyond",
        style: GoogleFonts.openSans(
          fontSize: 34,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
