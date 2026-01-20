import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';

class SmartCoachEmptyState extends StatelessWidget {
  const SmartCoachEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.robotAvatar, width: 80, height: 80),
          const SizedBox(height: 16),
          const Text(
            "Start a conversation with your Smart Coach!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
