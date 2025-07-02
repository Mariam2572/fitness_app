import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'dart:ui';

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


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية مع blur
        SizedBox.expand(
          child: Stack(
            children: [
             Positioned.fill(child:  Image.asset(
               AppAssets.homeBackGround,
               fit: BoxFit.cover,
             ),),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pushNamed(context, RoutesName.layOut),
              child: Image.asset("assets/images/Back.png", scale: 4),
            ),
          backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Smart Coach",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            iconTheme: const IconThemeData(color: Color(0xFFCB6A19)),
          ),
          endDrawer: Drawer(
            backgroundColor: Colors.transparent,
            child: BlocProvider.value(
              value: widget.previousConversationViewModel,
              child: PreviousConversationsScreen(
                onConversationSelected: (messages) {
                  setState(() {
                    _messages.clear();
                    _messages.addAll(messages);
                  });
                  widget.messages.clear();
                  widget.messages.addAll(messages);
                  print('Conversation loaded in SmartCoachView with \\${_messages.length} messages');
                },
              ),
            ),
          ),
          body: Column(
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
                          return Row(
                            mainAxisAlignment: isUser
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (!isUser)
                                const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(AppAssets.robotAvatar,),
                                  backgroundColor: Colors.transparent,
                                  ),
                              Flexible(
                                child: isUser
                                    ? Container(
                                        padding: const EdgeInsets.all(14),
                                        margin: const EdgeInsets.symmetric(vertical: 4),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFCB6A19),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            topRight: Radius.circular(18),
                                            bottomLeft: Radius.circular(18),
                                            bottomRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Text(
                                          msg.text,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(18),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            margin: const EdgeInsets.symmetric(vertical: 4),
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.08),
                                              border: Border.all(color: Colors.white24, width: 1),
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(18),
                                                topRight: Radius.circular(18),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(18),
                                              ),
                                            ),
                                            child: Text(
                                              msg.text,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              if (isUser)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundImage: AssetImage(AppAssets.user),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
              ),
              BlocConsumer<SmartCoachCubit, SmartCoachState>(
                listener: (context, state) {
                  if (state is SmartCoachFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: \\${state.message}")),
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: "Ask your coach...",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                  onSubmitted: (_) => _sendMessage(),
                                  enabled: state is! SmartCoachLoading,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send, color: Color(0xFFCB6A19)),
                                onPressed: state is SmartCoachLoading ? null : _sendMessage,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}