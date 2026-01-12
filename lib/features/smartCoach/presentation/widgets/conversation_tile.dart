// Widget للـ Conversation Tile
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/data/models/conversation_hive_model.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final ConversationHiveModel conversation;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ConversationTile({
    super.key,
    required this.conversation,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(conversation.conversationId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AppColors.mainRed,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: AppColors.baseWhite, size: 28),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: AppColors.neutral80,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Delete Conversation',
                style: TextStyle(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'Are you sure you want to delete this conversation? This action cannot be undone.',
                style: TextStyle(color: AppColors.neutral30),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.neutral30),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainRed,
                  ),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (_) => onDelete(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          conversation.title ?? 'Untitled Conversation',
          style: const TextStyle(
            color: AppColors.baseWhite,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4, left: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 12,
                  color: AppColors.neutral30,
                ),
                const SizedBox(width: 4),
                Text(
                  _formatDate(conversation.updatedAt),
                  style: const TextStyle(
                    color: AppColors.neutral30,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.message, size: 12, color: AppColors.neutral30),
                const SizedBox(width: 4),
                Text(
                  '${conversation.messages.length} messages',
                  style: const TextStyle(
                    color: AppColors.neutral30,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.neutral50),
        onTap: onTap,
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      final hours = difference.inHours;
      if (hours == 0) {
        final minutes = difference.inMinutes;
        return minutes == 0 ? 'Just now' : '$minutes min ago';
      }
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
