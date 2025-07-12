import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/previous_conversation_state.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_chat_screenbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousConversationsScreen extends StatefulWidget {
  const PreviousConversationsScreen({
    super.key,
    required this.onConversationSelected,
  });

  final void Function(List<ChatMessage>) onConversationSelected;

  @override
  State<PreviousConversationsScreen> createState() => _PreviousConversationsScreenState();
}

class _PreviousConversationsScreenState extends State<PreviousConversationsScreen> {
  @override
  void initState() {
    super.initState();
    // Load conversations when drawer opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<PreviousConversationViewModel>();
      viewModel.onIntent(LoadPreviousConversations());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous Conversations"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(width: 8),
                Text(
                  "Your Chat History",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: PreviousChatScreenbody(
              onConversationSelected: widget.onConversationSelected,
            ),
          ),
        ],
      ),
    );
  }
}