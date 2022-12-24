//widgets are in lib/widgets/podcast_page_widgets - named as the comments above them

import 'package:flutter/material.dart';
import 'package:podcast_app/pages/podcast_page/podcast_page_widgets/end_drawer.dart';
import '../../constants/constants.dart';
import 'podcast_page_widgets/control_buttons.dart';
import 'podcast_page_widgets/podcast_info_card.dart';
import 'podcast_page_widgets/podcast_time.dart';
import 'podcast_page_widgets/progress_bar.dart';
import 'podcast_page_widgets/top_icons_row.dart';

class PodcastPage extends StatelessWidget {
  final String podcastName;
  final String producerName;
  const PodcastPage({
    super.key,
    required this.podcastName,
    required this.producerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const EndDrawer(),
      backgroundColor: mainAppColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // top icons row
              const TopIcons(),
              const SizedBox(height: 15),

              //podcast info - podcast cover picture
              PodcastInfo(
                podcast: podcastName,
                producer: producerName,
              ),
              const SizedBox(height: 20),

              // podcast time - minutes at,repeat button,total minutes
              const PodcastTime(),
              const SizedBox(height: 15),

              //progress bar
              const ProgressBar(),
              const SizedBox(height: 20),

              //control buttons - previous,play/pause,next
              const ControlButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
