// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/presentation/views/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {

   RegisterScreen({
    Key? key,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RegisterScreenBody();
  }
}
