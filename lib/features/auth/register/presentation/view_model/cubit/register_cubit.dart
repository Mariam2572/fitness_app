import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int height = 0;
  int weight = 0;
  int age = 0;
  String? goal;
  String? activityLevel;
  static Gender selectedGender = Gender.female;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  doIntent() {}
}
