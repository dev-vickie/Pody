import 'package:flutter/material.dart';

class PodcastTime extends StatelessWidget {
  const PodcastTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text('19:02'),
        Icon(Icons.repeat),
        Text('38:57'),
      ],
    );
  }
}
