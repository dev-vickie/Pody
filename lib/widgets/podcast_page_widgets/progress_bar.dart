import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../neumorphic_box.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      child: LinearPercentIndicator(
        lineHeight: 10,
        percent: 0.5,
        progressColor: Colors.blue,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
