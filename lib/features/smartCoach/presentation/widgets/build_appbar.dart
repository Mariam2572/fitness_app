import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';

class BuildAppbar extends StatelessWidget {
  const BuildAppbar({super.key});

  @override
  Widget build(BuildContext context) {
return  AppBar(
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
      );
  }
}