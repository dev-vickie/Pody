import 'package:flutter/material.dart';

import '../neumorphic_box.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: const [
          Expanded(
            child: NeuBox(child: Icon(Icons.skip_previous_outlined, size: 30)),
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: NeuBox(child: Icon(Icons.pause_outlined, size: 30))),
          ),
          Expanded(
            child: NeuBox(child: Icon(Icons.skip_next_outlined, size: 30)),
          ),
        ],
      ),
    );
  }
}
