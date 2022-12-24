import 'package:flutter/material.dart';
import 'package:podcast_app/pages/homepage/list_all/list_all.dart';

class PopularName extends StatelessWidget {
  const PopularName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Popular',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ViewAll(),
                ),
              );
            },
            child: Text(
              'View all',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
