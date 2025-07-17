import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/features/auth/register/presentation/custom/custom_weight_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';

class ChooseWeightScreenBody extends StatelessWidget {

  const ChooseWeightScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWeightScreen(
      isEditProfile: false,
      initialValue: context.read<RegisterCubit>().weight,
      onChanged: (val) {
        context.read<RegisterCubit>().weight = val;
      },
    );
  }
}
