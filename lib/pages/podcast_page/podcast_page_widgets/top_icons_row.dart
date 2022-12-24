import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/neumorphic_box.dart';

class TopIcons extends StatelessWidget {
  const TopIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const SizedBox(
              height: 60,
              width: 60,
              child: NeuBox(child: Icon(Icons.arrow_back))),
        ),
        Text(
          'P O D C A S T',
          style: GoogleFonts.openSans(fontSize: 25),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: NeuBox(
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        ),
      ],
    );
  }
}
