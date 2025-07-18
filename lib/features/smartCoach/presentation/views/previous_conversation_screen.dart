import 'dart:ui';

import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_chat_screenbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';

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
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust blur strength
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Previous Conversations"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: PreviousChatScreenbody(
          onConversationSelected: widget.onConversationSelected,
        ),
      ),
    )
        )
    )
    ;
  }
}