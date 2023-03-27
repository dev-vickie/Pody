import 'package:flutter/material.dart';
import 'package:podcast_app/constants/constants.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.mainAppColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade400,
            offset: const Offset(5, 5),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.blue.shade50,
            offset: const Offset(-5, -5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
