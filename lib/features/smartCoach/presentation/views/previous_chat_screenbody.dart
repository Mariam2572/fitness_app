import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_intent.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/previous_conversations_header.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/previous_conversations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousConversationsScreen extends StatefulWidget {
  final VoidCallback onNewConversation;

  const PreviousConversationsScreen({
    super.key,
    required this.onNewConversation,
  });

  @override
  State<PreviousConversationsScreen> createState() =>
      _PreviousConversationsScreenState();
}

class _PreviousConversationsScreenState
    extends State<PreviousConversationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SmartCoachCubit>().doIntent(LoadConversationsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral90.withValues(alpha: 0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            PreviousConversationsHeader(
              onNewConversation: widget.onNewConversation,
            ),
            const Expanded(child: PreviousConversationsList()),
          ],
        ),
      ),
    );
  }
}
