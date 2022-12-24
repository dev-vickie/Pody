import 'package:flutter/material.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 60,
        child: NeuBox(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 50,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Flutter Ep1",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
