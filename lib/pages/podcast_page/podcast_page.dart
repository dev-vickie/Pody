//widgets are in lib/widgets/podcast_page_widgets - named as the comments above them

import 'package:flutter/material.dart';
import '../../widgets/podcast_page_widgets/control_buttons.dart';
import '../../widgets/podcast_page_widgets/podcast_info_card.dart';
import '../../widgets/podcast_page_widgets/podcast_time.dart';
import '../../widgets/podcast_page_widgets/progress_bar.dart';
import '../../widgets/podcast_page_widgets/top_icons_row.dart';

class PodcastPage extends StatelessWidget {
  final String podcastName;
  final String producerName;
  const PodcastPage(
      {super.key, required this.podcastName, required this.producerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // top icons row
              const TopIcons(),
              const SizedBox(height: 25),

              //podcast info - podcast cover picture
              PodcastInfo(
                podcast: podcastName,
                producer: producerName,
              ),
              const SizedBox(height: 25),

              // podcast time - minutes at,repeat button,total minutes
              const PodcastTime(),
              const SizedBox(height: 20),

              //progress bar
              const ProgressBar(),
              const SizedBox(height: 35),

              //control buttons - previous,play/pause,next
              const ControlButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
