import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/neumorphic_box.dart';

class PodcastInfo extends StatelessWidget {
  final String podcast;
  final String producer;
  const PodcastInfo({super.key, required this.podcast, required this.producer});

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/podcastimage.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      podcast,
                      style: GoogleFonts.openSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      producer,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite,
                  size: 28,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
