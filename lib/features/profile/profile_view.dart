import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/profile/cubit/profile_cubit.dart';
import 'package:fitness_app/features/profile/logout_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackGround,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                showLogoutDialog(context, () {
                  context.read<ProfileCubit>().doIntent(LogoutIntent());
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                });
              },
              child: const Text("Logout"),
            ),
          ),
        ),
      ],
    );
  }
}
