import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/home_viewbody.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_screen_body.dart';
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
          create: (context) => HomeViewCubit( getIt<HomeUseCase>())..doIntent(HomeViewDataIntent())
    
        ),
       
        BlocProvider(
          create:
              (context) => FoodCubit(
                getIt.get<GetFoodCategoriesUseCase>(),
                getIt.get<GetMealsByCategoryUseCase>(),
              ),
        ),
        
      ],
      child: const HomeScreenBody(),
    );
  }
}
