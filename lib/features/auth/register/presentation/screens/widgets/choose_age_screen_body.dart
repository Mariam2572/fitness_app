import 'package:fitness_app/features/auth/register/presentation/custom/custom_age.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseAgeScreenBody extends StatelessWidget {
  final int? value;

  const ChooseAgeScreenBody({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CustomAge(
      isEditProfile: false,
      initialValue: value ?? context.read<RegisterCubit>().age,
      onChanged: (val) {
        context.read<RegisterCubit>().age = val;
      },
    );}
}
