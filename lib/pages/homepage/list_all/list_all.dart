import 'package:flutter/material.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const NeuBox(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
