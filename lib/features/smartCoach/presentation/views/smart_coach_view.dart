import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/smartCoach/data/models/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/cubit/smart_coach_cubit.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_chat_screenbody.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/smart_coach_background.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/smart_coach_chat_list.dart';
import 'package:fitness_app/features/smartCoach/presentation/widgets/smart_coach_input_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartCoachView extends StatefulWidget {
  const SmartCoachView({super.key, this.conversationId, this.initialMessages});

  final String? conversationId;
  final List<ChatMessage>? initialMessages;

  @override
  State<SmartCoachView> createState() => _SmartCoachViewState();
}

class _SmartCoachViewState extends State<SmartCoachView> {
  @override
  void initState() {
    super.initState();
      context.read<SmartCoachCubit>().initialize(
        conversationId: widget.conversationId,
        initialMessages: widget.initialMessages,
      );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(AppAssets.backButton, width: 32, height: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Smart Coach"),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
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
        child: PreviousConversationsScreen(
          onNewConversation: () {
            context.read<SmartCoachCubit>().startNewConversation();
            Navigator.pop(context); // Close drawer
          },
        ),
      ),
      body: Stack(
        children: [
          const SmartCoachBackground(),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Expanded(
                  child: BlocListener<SmartCoachCubit, SmartCoachState>(
                    listener: (context, state) {
                      if (state.errorMessage != null &&
                          state.status == SmartCoachStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error: ${state.errorMessage}"),
                            backgroundColor: AppColors.mainRed,
                          ),
                        );
                      }
                    },
                    child: const SmartCoachChatList(),
                  ),
                ),
                const SmartCoachInputArea(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
