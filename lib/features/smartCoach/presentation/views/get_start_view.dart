
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'dart:ui';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/smart_coach_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStartView extends StatefulWidget {
  final String userName;
  final List<ChatMessage> messages;
  final void Function(List<ChatMessage> messages) onSessionEnd;
  final PreviousConversationViewModel previousConversationViewModel;

  const GetStartView({super.key, required this.userName, required this.messages, required this.onSessionEnd, required this.previousConversationViewModel, });

  @override
  State<GetStartView> createState() => _GetStartViewState();
}

class _GetStartViewState extends State<GetStartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        child: BlocProvider.value(
          value: widget.previousConversationViewModel,
          child: PreviousConversationsScreen(
            onConversationSelected: (messages) {
              Navigator.pop(context);
              // Delay the push until after the drawer is closed
              Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SmartCoachView(
                      messages: messages,
                      onSessionEnd: widget.onSessionEnd,
                      previousConversationViewModel: widget.previousConversationViewModel,
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // Background blur effect
          Positioned.fill(
            child: Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, RoutesName.layOut),
                        child: Image.asset(
                          AppAssets.backButton, // Make sure this exists, or use another asset path
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Image.asset(
                            AppAssets.drawerIcon,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Greeting Text
                Text(
                  'Hi ${widget.userName},',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'I Am Your Smart Coach',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                // Centered Robot Image
                Expanded(
                  child: Center(
                    child: Image.asset(
                      AppAssets.robot,
                      width: 220,
                      height:350,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Bottom Card
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 32.0,
                    left: 16,
                    right: 16,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 8 ,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'How Can I Assist You\nToday ?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainRed,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SmartCoachView(
                                        messages: widget.messages,
                                        onSessionEnd: widget.onSessionEnd,
                                        previousConversationViewModel: widget.previousConversationViewModel,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
