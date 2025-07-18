import 'dart:async';

import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_view.dart';
import 'package:fitness_app/features/profile/profile_view.dart';
import 'package:fitness_app/features/smartCoach/data/message_model.dart';
import 'package:fitness_app/features/smartCoach/data/models/ConversationModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/previous_conversation_screen.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/smart_coach_view.dart';
import 'package:fitness_app/features/smartCoach/presentation/views/get_start_view.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:fitness_app/features/workOuts/presentation/view_model/cubit/work_outs_cubit.dart';
import 'package:fitness_app/features/workOuts/presentation/views/work_outs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  final List<ChatMessage> smartCoachMessages = [];
  final _previousViewModel = getIt<PreviousConversationViewModel>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  late final List<Widget> _screens;
  late StreamSubscription? _conversationSubscription;

  @override
  void initState() {
    super.initState();
    _initializeScreens();
    _setupConversationListener();
  }

  @override
  void dispose() {
    _conversationSubscription?.cancel();
    super.dispose();
  }

  void _setupConversationListener() {
    // Listen for conversation selection events from the previous conversation screen
    _conversationSubscription = _previousViewModel.conversationSelectedStream?.listen((selectedMessages) {
      _loadSelectedConversation(selectedMessages);
    });
  }

  void _initializeScreens() {
    _screens = [
      const HomeView(),
      GetStartView(
        userName: "Ahmed", // or get from user profile
        messages: smartCoachMessages,
        onSessionEnd: _handleSessionEnd,
        previousConversationViewModel: _previousViewModel,
      ),
      BlocProvider(
        create: (context) => WorkOutsCubit(
          getIt<GetAllMusclesGroupsUseCase>(),
          getIt<GetAllMusclesByMuscleGroupIdUseCase>(),
        )..doIntent(GetAllMusclesGroupsIntent()),
        child: const WorkOutsView(),
      ),
      const ProfileView(),
    ];
  }

  void _loadSelectedConversation(List<ChatMessage> selectedMessages) {
    print('Loading conversation with ${selectedMessages.length} messages');

    setState(() {
      // Clear current messages and load the selected conversation
      smartCoachMessages.clear();
      smartCoachMessages.addAll(selectedMessages);

      // Navigate to Smart Coach tab
      _selectedIndex = 1;

      // Reinitialize screens to refresh the SmartCoachView with new messages
      _initializeScreens();
    });

    print('Conversation loaded, switching to Smart Coach tab');
  }

  void _handleSessionEnd(List<ChatMessage> messages) {
    // This will be called when SmartCoachView is deactivated
    // Just sync the messages, don't save here to avoid duplicate saves
    smartCoachMessages.clear();
    smartCoachMessages.addAll(messages);
  }

  void _saveCurrentConversation() {
    if (smartCoachMessages.isNotEmpty) {
      try {
        final conversation = ConversationModel(
          messages: List.from(smartCoachMessages), // Create a deep copy
          timestamp: DateTime.now(),
        );

        _previousViewModel.saveNewConversation(conversation);
        print('Conversation saved with ${smartCoachMessages.length} messages'); // Debug log

        // Clear messages after saving
        smartCoachMessages.clear();

        // Reinitialize screens to reset the SmartCoachView
        setState(() {
          _initializeScreens();
        });

      } catch (e) {
        print('Error saving conversation: $e'); // Debug log
      }
    }
  }

  void _onItemTapped(int index) {
    bool navigatingAwayFromSmartCoach = _selectedIndex == 1 && index != 1;

    if (navigatingAwayFromSmartCoach) {
      _saveCurrentConversation();
      smartCoachMessages.clear();
    }

    // First update index and rebuild layout
    setState(() {
      _selectedIndex = index;
    });

    // After UI is stable, re-initialize screens if needed
    if (navigatingAwayFromSmartCoach) {
      _initializeScreens();
    }
  }


  BottomNavigationBarItem _buildBarItem(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: ImageIcon(AssetImage(iconPath), size: 24),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: _screens[_selectedIndex],
      drawer: _selectedIndex == 1 ? null : Drawer(
        child: BlocProvider.value(
          value: _previousViewModel,
          child: PreviousConversationsScreen(
            onConversationSelected: _loadSelectedConversation,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24, right: 32, left: 32),
        child: Container(
          decoration: BoxDecoration(
            color: theme.bottomNavigationBarTheme.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                _buildBarItem("assets/images/home.png", "Home"),
                _buildBarItem("assets/images/smart chat.png", "Smart Chat"),
                _buildBarItem("assets/images/work outs.png", "Work Outs"),
                _buildBarItem("assets/images/profile.png", "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}