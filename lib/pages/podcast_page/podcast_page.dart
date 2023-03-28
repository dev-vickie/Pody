import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';
import '../../constants/constants.dart';
import '../../models/podcast_model.dart';
import 'podcast_page_widgets/end_drawer.dart';
import 'podcast_page_widgets/podcast_info_card.dart';
import 'podcast_page_widgets/top_icons_row.dart';

class PodcastPage extends StatefulWidget {
  final PodcastItem podcast;
  const PodcastPage({
    required this.podcast,
    super.key,
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
    setAudio(widget.podcast.audioUrl);
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          isplaying = event == PlayerState.playing;
        });
      }
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
    super.initState();
  }

  Future setAudio(podcastUrl) async {
    
    await audioPlayer.play(UrlSource(podcastUrl));
  }

  @override
  void dispose() {
    removeAudioListeners();
    audioPlayer.dispose();
    super.dispose();
  }

  void removeAudioListeners() {
    audioPlayer.onPlayerStateChanged.drain();
    audioPlayer.onDurationChanged.drain();
    audioPlayer.onPositionChanged.drain();
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
                podcastName: widget.podcast.name,
                producer: widget.podcast.producer,
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
