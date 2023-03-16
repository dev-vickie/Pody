import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../utils/neumorphic_box.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  const ControlButtons(
      {super.key, required this.isPlaying, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Expanded(
            child: NeuBox(child: Icon(Icons.skip_previous_outlined, size: 30)),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: NeuBox(
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.setSourceUrl('');
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_outlined : Icons.play_arrow,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: NeuBox(child: Icon(Icons.skip_next_outlined, size: 30)),
          ),
        ],
      ),
    );
  }
}
