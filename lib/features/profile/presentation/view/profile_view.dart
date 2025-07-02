import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data.dart';
import 'package:fitness_app/features/profile/domain/use_case/upload_photo__use_case.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_back_button.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_list_tile.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/languge.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(getIt<GetProfileData>(), getIt<UploadPhoto>())
                ..doIntent(LoadProfileIntent()),
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({super.key});

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
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileSuccess) {
                  final user = state.user;
                  return Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BuildBackButton(),
                          SizedBox(width: 80),
                          Text(
                            'Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          user.user!.photo ?? 'https://i.imgur.com/BoN9kdC.png',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.user!.firstName ?? 'User Name',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("  "),
                          Text(
                            user.user!.lastName ?? 'User Name',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      _buildSettingsList(),
                    ],
                  );
                } else if (state is ProfileError) {
                  return Center(
                    child: Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2D).withAlpha(100),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              BuildListTile(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {},
              ),

              BuildListTile(
                icon: Icons.cached_outlined,
                title: 'Change Password',
                onTap: () {},
              ),
              Languge(),
              BuildListTile(
                icon: Icons.security,
                title: 'Security',
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.help_outline_outlined,
                title: 'Help',
                onTap: () {},
              ),
              BuildListTile(
                icon: Icons.logout,
                title: 'Logout',
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
