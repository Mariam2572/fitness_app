import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartCoachView extends StatefulWidget {
  const SmartCoachView({
    super.key,
    required this.messages,
    required this.onSessionEnd,
    required this.previousConversationViewModel
  });

  final List<ChatMessage> messages;
  final void Function(List<ChatMessage>) onSessionEnd;
  final PreviousConversationViewModel previousConversationViewModel;

  @override
  State<SmartCoachView> createState() => _SmartCoachViewState();
}

class _SmartCoachViewState extends State<SmartCoachView> {
  final TextEditingController _controller = TextEditingController();
  late List<ChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    // Initialize messages - use passed messages if available, otherwise start fresh
    _messages = List.from(widget.messages);
    print('SmartCoachView initialized with ${_messages.length} messages'); // Debug log
  }

  @override
  void didUpdateWidget(SmartCoachView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update messages when widget is rebuilt with new messages
    if (widget.messages != oldWidget.messages) {
      setState(() {
        _messages = List.from(widget.messages);
      });
      print('SmartCoachView updated with ${_messages.length} messages'); // Debug log
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // Always call the session end callback with current messages
    widget.onSessionEnd(_messages);
    super.deactivate();
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
    // Also update the parent's message list
    widget.messages.clear();
    widget.messages.addAll(_messages);
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(role: 'user', text: text);
    _addMessage(userMessage);
    _controller.clear();

    context.read<SmartCoachCubit>().doIntent(
      GetSmartCoachIntent(prompt: text),
    );
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
    });
    widget.messages.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chat cleared'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Coach"),
        actions: [
          if (_messages.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _clearChat,
              tooltip: 'Clear Chat',
            ),
        ],
      ),
      drawer: Drawer(
        child: BlocProvider.value(
          value: widget.previousConversationViewModel,
          child: PreviousConversationsScreen(
            onConversationSelected: (messages) {
              // When a conversation is selected from the drawer, update the current chat
              setState(() {
                _messages.clear();
                _messages.addAll(messages);
              });
              // Update the parent's message list
              widget.messages.clear();
              widget.messages.addAll(messages);

              print('Conversation loaded in SmartCoachView with ${_messages.length} messages');
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? const Center(
                child: Text(
                  "Start a conversation with your Smart Coach!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (_, index) {
                  final msg = _messages[index];
                  final isUser = msg.role == 'user';
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        msg.text,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocConsumer<SmartCoachCubit, SmartCoachState>(
              listener: (context, state) {
                if (state is SmartCoachFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${state.message}")),
                  );
                }
                if (state is SmartCoachSuccess) {
                  final aiMessage = ChatMessage(role: 'ai', text: state.response);
                  _addMessage(aiMessage);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    if (state is SmartCoachLoading)
                      const LinearProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: "Ask your coach...",
                                border: OutlineInputBorder(),
                              ),
                              onSubmitted: (_) => _sendMessage(),
                              enabled: state is! SmartCoachLoading,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: state is SmartCoachLoading ? null : _sendMessage,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}