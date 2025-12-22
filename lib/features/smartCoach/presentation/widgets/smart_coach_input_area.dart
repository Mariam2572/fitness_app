import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartCoachInputArea extends StatefulWidget {
  const SmartCoachInputArea({super.key});

  @override
  State<SmartCoachInputArea> createState() => _SmartCoachInputAreaState();
}

class _SmartCoachInputAreaState extends State<SmartCoachInputArea> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage(SmartCoachState state) {
    final text = _controller.text.trim();
    if (text.isEmpty || state.isTyping) return;

    _controller.clear();
    context.read<SmartCoachCubit>().sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartCoachCubit, SmartCoachState>(
      builder: (context, state) {
        return Container(
          color: AppColors.neutral90.withValues(alpha: 0.7),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ask your coach...",
                      hintStyle: const TextStyle(color: AppColors.neutral30),
                      filled: true,
                      fillColor: AppColors.neutral80.withValues(alpha: 0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    style: const TextStyle(color: AppColors.baseWhite),
                    onSubmitted: (_) => _sendMessage(state),
                    enabled:
                        !state.isTyping &&
                        state.status != SmartCoachStatus.loading,
                    maxLines: null,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.mainRed,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon:
                        state.isTyping
                            ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.baseWhite,
                                strokeWidth: 2,
                              ),
                            )
                            : const Icon(
                              Icons.send,
                              color: AppColors.baseWhite,
                            ),
                    onPressed:
                        (state.isTyping ||
                                state.status == SmartCoachStatus.loading)
                            ? null
                            : () => _sendMessage(state),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
