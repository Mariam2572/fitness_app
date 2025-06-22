

import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_viewbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => getIt.get<HomeViewModel>()..doIntent(InitialLoad()),
      child: const HomeViewBody(),
    );
  }
}
