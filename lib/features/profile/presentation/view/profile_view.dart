import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data.dart';
import 'package:fitness_app/features/profile/domain/use_case/upload_photo__use_case.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_back_button.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_list_tile.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ProfileView extends StatefulWidget {
//   final viewModel = ProfileCubit(getIt<GetProfileData>(), getIt<UploadPhoto>());
//   ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create:
//           (context) => ProfileCubit(
//             getIt.get<GetProfileData>(),
//             getIt.get<UploadPhoto>(),
//           )..doIntent(LoadProfileIntent()),
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(AppAssets.homeBackground),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SafeArea(
//               child: BlocBuilder<ProfileCubit, ProfileState>(
//                 builder: (BuildContext context, ProfileState state) {
//                   if (state is HomeLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (state is HomeSuccess) {
//                     return Column(
//                       children: [
//                         const Row(
//                           children: [
//                             BuildBackButton(),
//                             Text(
//                               textAlign: TextAlign.center,
//                               'Profile',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 16),
//                         const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: NetworkImage(
//                             'https://i.imgur.com/BoN9kdC.png', // sample image
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Ahmed Mohamed',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         _buildSettingsList(context),
//                       ],
//                     );
//                   } else if (state is HomeError) {
//                     return Center(child: Text('Error: ${state.message}'));
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsList(BuildContext context) {
//     return const Column(
//       children: [
//         ListTile(
//           title: Text('Setting 1', style: TextStyle(color: Colors.white)),
//         ),
//         ListTile(
//           title: Text('Setting 2', style: TextStyle(color: Colors.white)),
//         ),
//       ],
//     );
//   }
// }

// Widget _buildSettingsList(BuildContext context) {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.only(right: 22, left: 22),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFF2D2D2D).withValues(alpha: 0.4),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         padding: const EdgeInsets.all(8),

//         child: ListView(
//           children: [
//             BuildListTile(
//               icon: Icons.person_outline,
//               title: 'Edit Profile',
//               notSelectLanguge: true,
//               onTap: () {},
//             ),
//             BuildListTile(
//               icon: Icons.lock_outline,
//               title: 'Change Password',
//               notSelectLanguge: true,
//               onTap: () {},
//             ),

//             BuildListTile(
//               icon: Icons.language,
//               title: 'Select Language (English)',
//               notSelectLanguge: false,
//             ),
//             BuildListTile(
//               icon: Icons.security,
//               title: 'Security',
//               notSelectLanguge: true,
//               onTap: () {},
//             ),
//             BuildListTile(
//               icon: Icons.privacy_tip_outlined,
//               title: 'Privacy Policy',
//               notSelectLanguge: true,
//               onTap: () {},
//             ),
//             BuildListTile(
//               icon: Icons.help_outline,
//               title: 'Help',
//               notSelectLanguge: true,
//               onTap: () {},
//             ),
//             BuildListTile(
//               icon: Icons.logout,
//               title: 'Logout',
//               notSelectLanguge: true,
//               color: AppColors.mainRed,
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/build_list_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                        children: [
                          BuildBackButton(),
                          Expanded(
                            child: Text(
                              'Profile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
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
                      Text(
                        user.user!.firstName ?? 'User Name',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
