import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_back_button.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Row(
                  children: [
                    BuildBackButton(),
                    Text(
                      textAlign: TextAlign.center,
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://i.imgur.com/BoN9kdC.png', // sample image
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ahmed Mohamed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildSettingsList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 22, left: 22),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF2D2D2D).withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),

          child: ListView(
            children: [
              BuildListTile(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                notSelectLanguge: true,
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                notSelectLanguge: true,
                onTap: () {},
              ),

              BuildListTile(
                icon: Icons.language,
                title: 'Select Language (English)',
                notSelectLanguge: false,
              ),
              BuildListTile(
                icon: Icons.security,
                title: 'Security',
                notSelectLanguge: true,
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                notSelectLanguge: true,
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.help_outline,
                title: 'Help',
                notSelectLanguge: true,
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.logout,
                title: 'Logout',
                notSelectLanguge: true,
                color: AppColors.mainRed,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
