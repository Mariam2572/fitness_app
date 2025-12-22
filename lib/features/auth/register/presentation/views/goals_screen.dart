import 'package:fitness_app/features/auth/register/presentation/custom/custom_goals.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomGoalsScreen(
      isEditProfile: false,
      onChanged: (val) {
        context.read<RegisterCubit>().goal = val;
      },
    );
  }
}
