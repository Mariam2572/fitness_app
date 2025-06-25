import 'package:fitness_app/features/home/presentation/views/home_view.dart';
import 'package:fitness_app/features/profile/profile_view.dart';
import 'package:fitness_app/features/smartCoach/smart_coach_view.dart';
import 'package:fitness_app/features/workOuts/work_outs_view.dart';
import 'package:flutter/material.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    SmartCoachView(),
    WorkOutsView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 32, left: 32),
            child: Container(
              decoration: BoxDecoration(
                color:
                    theme.bottomNavigationBarTheme.backgroundColor ??
                    Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  // elevation: 0,
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
        ),
      ),
    );
  }
}
