import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Greetings extends StatelessWidget {
  final String username;
  const Greetings({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello $username 👋',
            style: GoogleFonts.openSans(
              color: Colors.grey[700],
              fontSize: 25,
            ),
          ),
          const Icon(
            Icons.mic,
            size: 30,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
