import 'dart:ui';

import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/smart_coach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStartScreen extends StatelessWidget {
  final List<ChatMessage> smartCoachMessages;
  final void Function(List<ChatMessage>) onSessionEnd;
  final PreviousConversationViewModel previousConversationViewModel;

  const GetStartScreen({
    super.key,
    required this.smartCoachMessages,
    required this.onSessionEnd,
    required this.previousConversationViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        child: BlocProvider.value(
          value: previousConversationViewModel,
          child: PreviousConversationsScreen(
            onConversationSelected: (messages) {
              Navigator.of(context).pop(); // Close drawer first
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartCoachView(
                    key: ValueKey('smart_coach_${DateTime.now().millisecondsSinceEpoch}'),
                    messages: messages,
                    onSessionEnd: onSessionEnd,
                    previousConversationViewModel: previousConversationViewModel,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image with dark overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          // Top bar: Back button and menu
          Positioned(
            top: 24,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/images/Back.png", scale: 4),
            ),
          ),
          Positioned(
            top: 28,
            right: 16,
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(Icons.drag_handle_sharp, color: AppColors.mainRed, size: 28),
              ),
            ),
          ),
          // Greeting and subtitle
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hi ,',
                  style: AppTextStyle.instance.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'I Am Your Smart Coach',
                  style: AppTextStyle.instance.textStyle20.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Robot image
          const Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Image(image: AssetImage(
              AppAssets.robot,),
              height: 280,
              fit: BoxFit.contain,
            ),),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(32)

              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'How Can I Assist You\nToday ?',
                            style: AppTextStyle.instance.textStyle20.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
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
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SmartCoachView(
                                      key: ValueKey('smart_coach_${DateTime.now().millisecondsSinceEpoch}'),
                                      messages: smartCoachMessages,
                                      onSessionEnd: onSessionEnd,
                                      previousConversationViewModel: previousConversationViewModel,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
