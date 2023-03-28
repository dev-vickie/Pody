import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/neumorphic_box.dart';

class PodcastInfo extends StatelessWidget {
  final String podcastName;
  final String producer;
  const PodcastInfo({super.key, required this.podcastName, required this.producer});

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/podcastimage.png',
              height: MediaQuery.of(context).size.height * 0.50,
            ),
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
                      podcastName,
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
