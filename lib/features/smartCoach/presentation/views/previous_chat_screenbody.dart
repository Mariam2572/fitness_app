import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/previous_conversation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousChatScreenbody extends StatelessWidget {
  const PreviousChatScreenbody({
    super.key,
    required this.onConversationSelected,
  });

  final void Function(List<ChatMessage>) onConversationSelected;

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String _getConversationPreview(List<ChatMessage> messages) {
    if (messages.isEmpty) return 'Empty conversation';

    // Find the first user message for preview
    final userMessage = messages.firstWhere(
          (msg) => msg.role == 'user',
      orElse: () => messages.first,
    );

    // Truncate if too long
    if (userMessage.text.length > 100) {
      return '${userMessage.text.substring(0, 100)}...';
    }
    return userMessage.text;
  }

  void _navigateToSmartCoach(BuildContext context, List<ChatMessage> messages) {
    print('Card tapped - navigating to SmartCoach with ${messages.length} messages');

    // Use the ViewModel to notify about conversation selection
    final viewModel = context.read<PreviousConversationViewModel>();
    viewModel.selectConversation(messages);

    // Call the callback for the LayOut to handle the navigation
    onConversationSelected(messages);

    // Close the drawer if we're in a drawer context
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousConversationViewModel, PreviousConversationState>(
      builder: (context, state) {
        print('Current state: ${state.runtimeType}'); // Debug log

        if (state is LoadingState) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading conversations..."),
              ],
            ),
          );
        } else if (state is LoadedState) {
          print('Loaded ${state.conversations.length} conversations'); // Debug log

          if (state.conversations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "📭 No previous conversations yet.",
                    style: AppTextStyle.instance.textStyle16.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Start chatting with your Smart Coach!",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          // Sort conversations by timestamp (newest first)
          final sortedConversations = List.from(state.conversations)
            ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: sortedConversations.length,
            itemBuilder: (context, index) {
              final convo = sortedConversations[index];
              final preview = _getConversationPreview(convo.messages);
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => _navigateToSmartCoach(context, convo.messages),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFFCB6A19),
                        size: 22,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          preview,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  "❌ Error: ${state.message}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<PreviousConversationViewModel>()
                        .onIntent(LoadPreviousConversations());
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("🤷‍♂️Unknown state"),
          );
        }
      },
    );
  }
}