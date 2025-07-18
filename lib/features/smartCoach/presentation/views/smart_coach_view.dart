import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              AppAssets.backButton, // Make sure this exists, or use another asset path
              width: 32,
              height: 32,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.layOut);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Smart Coach"),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                AppAssets.drawerIcon,
                width: 32,
                height: 32,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
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
              print('Conversation loaded in SmartCoachView with ${_messages.length} messages');
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          // Blurred background image
          Positioned.fill(
            child: Image.asset(
              AppAssets.authBackGround,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: AppColors.baseBlack.withOpacity(0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
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
                            return Row(
                              mainAxisAlignment: isUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (!isUser) ...[
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(AppAssets.chatRobot),
                                    radius: 18,
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: isUser
                                          ? AppColors.mainRed
                                          : AppColors.neutral90.withOpacity(0.85),
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(16),
                                        topRight: const Radius.circular(16),
                                        bottomLeft: Radius.circular(isUser ? 16 : 0),
                                        bottomRight: Radius.circular(isUser ? 0 : 16),
                                      ),
                                    ),
                                    child: Text(
                                      msg.text,
                                      style: TextStyle(
                                        color: AppColors.baseWhite,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                if (isUser) ...[
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(AppAssets.user),
                                    radius: 18,
                                  ),
                                ],
                              ],
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
                    return Container(
                      color: AppColors.neutral90.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: "Ask your coach...",
                                hintStyle: TextStyle(color: AppColors.neutral30),
                                filled: true,
                                fillColor: AppColors.neutral80.withOpacity(0.7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              style: TextStyle(color: AppColors.baseWhite),
                              onSubmitted: (_) => _sendMessage(),
                              enabled: state is! SmartCoachLoading,
                            ),
                          ),
                          const SizedBox(width: 8),

                          IconButton(
                            icon: Icon(Icons.send, color: AppColors.mainRed),
                            onPressed: state is SmartCoachLoading ? null : _sendMessage,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}