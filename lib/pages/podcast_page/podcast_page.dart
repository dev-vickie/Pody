import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';
import '../../constants/constants.dart';
import 'podcast_page_widgets/end_drawer.dart';
import 'podcast_page_widgets/podcast_info_card.dart';
import 'podcast_page_widgets/top_icons_row.dart';

class PodcastPage extends StatefulWidget {
  final String podcastName;
  final String producerName;
  const PodcastPage({
    super.key,
    required this.podcastName,
    required this.producerName,
  });

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  final audioPlayer = AudioPlayer();
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isplaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
    super.initState();
  }

  Future setAudio() async {
    String url =
        'https://firebasestorage.googleapis.com/v0/b/reddit-184a2.appspot.com/o/y2mate.com%20-%20NYASHINSKI%20%20TOP%20FORM%20Official%20Audio.mp3?alt=media&token=1386c2f2-45e7-46c4-aab5-357432336bf4';
    await audioPlayer.play(UrlSource(url));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const EndDrawer(),
      backgroundColor: AppColors.mainAppColor,
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
                podcast: widget.podcastName,
                producer: widget.producerName,
              ),
              const SizedBox(height: 20),

              // podcast time - minutes at,repeat button,total minutes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  ),
                  const Icon(Icons.repeat),
                  Text(
                    '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  ),
                ],
              ),
              const SizedBox(height: 15),

              //progress bar
              NeuBox(
                child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                  },
                ),
              ),
              const SizedBox(height: 20),

              //control buttons - previous,play/pause,next
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    const Expanded(
                      child: NeuBox(
                          child: Icon(Icons.skip_previous_outlined, size: 30)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: NeuBox(
                          child: IconButton(
                            onPressed: () async {
                              if (isplaying) {
                                await audioPlayer.pause();
                              } else {
                                audioPlayer.resume();
                              }
                            },
                            icon: Icon(
                              isplaying
                                  ? Icons.pause_outlined
                                  : Icons.play_arrow,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: NeuBox(
                          child: Icon(Icons.skip_next_outlined, size: 30)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
