import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/smart_coach_empty_state.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/typewriter_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartCoachChatList extends StatefulWidget {
  const SmartCoachChatList({super.key});

  @override
  State<SmartCoachChatList> createState() => _SmartCoachChatListState();
}

class _SmartCoachChatListState extends State<SmartCoachChatList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmartCoachCubit, SmartCoachState>(
      listener: (context, state) {
        // Auto-scroll on new message
        if (state.messages.isNotEmpty || state.isTyping) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );
        }
      },
      builder: (context, state) {
        if (state.status == SmartCoachStatus.initial &&
            state.messages.isEmpty) {
          return const SmartCoachEmptyState();
        }

        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: state.messages.length + (state.isTyping ? 1 : 0),
          itemBuilder: (_, index) {
            if (index == state.messages.length) {
              return _buildTypingIndicator();
            }

            final msg = state.messages[index];
            final isUser = msg.role == 'user';
            final isLastAiMessage =
                !isUser && index == state.messages.length - 1 && state.isNewMessage;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment:
                    isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (!isUser) ...[
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(AppAssets.robotAvatar),
                      radius: 18,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isUser
                                ? AppColors.mainRed
                                : AppColors.neutral90.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isUser ? 16 : 0),
                          bottomRight: Radius.circular(isUser ? 0 : 16),
                        ),
                      ),
                      child:
                          isLastAiMessage
                              ? TypewriterText(
                                text: msg.text,
                                style: const TextStyle(
                                  color: AppColors.baseWhite,
                                  fontSize: 15,
                                ),
                              )
                              : Text(
                                msg.text,
                                style: const TextStyle(
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
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(AppAssets.robotAvatar),
            radius: 18,
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.neutral90.withValues(alpha: 0.85),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.baseWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
