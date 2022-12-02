import 'package:flutter/material.dart';

class FeaturingPodcast extends StatelessWidget {
  const FeaturingPodcast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        'Featuring podcast',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
