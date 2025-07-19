import 'package:fitness_app/features/auth/register/presentation/custom/custom_height_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseHeightScreenBody extends StatelessWidget {

  const ChooseHeightScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
  return CustomHeightScreen(
    isEditProfile: false,
    initialValue: context.read<RegisterCubit>().height,
    onChanged: (val) {
      context.read<RegisterCubit>().height = val;
    },
  );
  }
}
