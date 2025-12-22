import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PreviousConversationsHeader extends StatelessWidget {
  final VoidCallback onNewConversation;

  const PreviousConversationsHeader({
    super.key,
    required this.onNewConversation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Conversations',
                style: TextStyle(
                  color: AppColors.baseWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: AppColors.mainRed,
                  size: 28,
                ),
                onPressed: onNewConversation,
                tooltip: 'New Conversation',
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.neutral70, height: 1),
      ],
    );
  }
}
