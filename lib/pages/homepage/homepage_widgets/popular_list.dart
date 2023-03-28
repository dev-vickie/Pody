import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/models/podcast_model.dart';
import 'package:podcast_app/pages/podcast_page/podcast_page.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';

class PopularPodcastsList extends StatelessWidget {
  final PodcastItem podcast;
  const PopularPodcastsList({
    required this.podcast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PodcastPage(
            podcast: podcast,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: NeuBox(
            child: Row(
              children: [
                //Container for image icon

                const Padding(
                  padding: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Image(
                      height: 60,
                      width: 60,
                      image: AssetImage('assets/vmimage.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                //Podcast name and Podcast producer's name

                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        podcast.name, //podcast name
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        podcast.producer, //producer
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
                // Play Podcast icon

                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.play_arrow_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
