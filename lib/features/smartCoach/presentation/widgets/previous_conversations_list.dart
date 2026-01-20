import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/conversation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousConversationsList extends StatelessWidget {
  const PreviousConversationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartCoachCubit, SmartCoachState>(
      builder: (context, state) {
        if (state.isHistoryLoading && state.conversations.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainRed),
          );
        }

        if (state.conversations.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 64,
                  color: AppColors.neutral30,
                ),
                SizedBox(height: 16),
                Text(
                  'No conversations yet',
                  style: TextStyle(color: AppColors.neutral30, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Start a new conversation!',
                  style: TextStyle(color: AppColors.neutral50, fontSize: 14),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: state.conversations.length,
          itemBuilder: (context, index) {
            final conversation = state.conversations[index];
            final isSelected =
                conversation.conversationId == state.currentConversationId;

            return Container(
              color:
                  isSelected
                      ? AppColors.neutral80.withValues(alpha: 0.5)
                      : Colors.transparent,
              child: ConversationTile(
                conversation: conversation,
                onTap: () {
                  context.read<SmartCoachCubit>().loadConversation(
                    conversation.conversationId,
                  );
                  Navigator.pop(context); // Close drawer
                },
                onDelete: () {
                  context.read<SmartCoachCubit>().deleteConversation(
                    conversation.conversationId,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
