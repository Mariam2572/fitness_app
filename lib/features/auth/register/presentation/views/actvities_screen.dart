// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/features/auth/register/presentation/custom/custom_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';

class ActivtiesScreen extends StatefulWidget {
  const ActivtiesScreen({super.key});

  @override
  State<ActivtiesScreen> createState() => _ActivtiesScreenState();
}

class _ActivtiesScreenState extends State<ActivtiesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomActivtiesScreen(
      isEditProfile: false,
      onChanged: (val) {
        context.read<RegisterCubit>().activityLevel = val;
      },
    );
  }
}
