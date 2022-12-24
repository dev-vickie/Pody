import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:podcast_app/pages/podcast_page/podcast_page.dart';

import '../../../utils/neumorphic_box.dart';

class FeaturingPodcastCard extends StatelessWidget {
  final String podcastName;
  final String producerName;
  const FeaturingPodcastCard(
      {super.key, required this.podcastName, required this.producerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 280,
        width: MediaQuery.of(context).size.width,
        child: NeuBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Lottie.asset('assets/podcast.json'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  //work life balance
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      podcastName,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //author -episodes
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'By $producerName' ' - ' "12 Episodes",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  //listen button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PodcastPage(
                              podcastName: podcastName,
                              producerName: producerName),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Listen to Podcast',
                                style: TextStyle(
                                    color: Colors.grey[900], fontSize: 17),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                Icons.play_circle_filled_rounded,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
