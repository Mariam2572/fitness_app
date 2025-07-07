import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_viewbody.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:fitness_app/features/workOuts/presentation/view_model/cubit/work_outs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => getIt.get<HomeViewModel>()..doIntent(InitialLoad()),
        ),
        BlocProvider(
          create:
              (context) => WorkOutsCubit(
                getIt.get<GetAllMusclesGroupsUseCase>(),
                getIt.get<GetAllMusclesByMuscleGroupIdUseCase>(),
              )..doIntent(GetAllMusclesGroupsIntent()),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
