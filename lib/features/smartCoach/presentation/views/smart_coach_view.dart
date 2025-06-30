import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SmartCoachView extends StatefulWidget {
  const SmartCoachView({super.key});

  @override
  State<SmartCoachView> createState() => _SmartCoachViewState();
}

class _SmartCoachViewState extends State<SmartCoachView> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Coach")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
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
                  setState(() {
                    _messages.add(ChatMessage(role: 'ai', text: state.response));
                  });
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    if (state is SmartCoachLoading)
                      const LinearProgressIndicator(),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Ask your coach...",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            final text = _controller.text.trim();
                            if (text.isEmpty) return;
                            setState(() {
                              _messages.add(ChatMessage(role: 'user', text: text));
                              _controller.clear();
                            });
                            context.read<SmartCoachCubit>().doIntent(
                              GetSmartCoachIntent(prompt: text),
                            );
                          },
                        ),
                      ],
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


