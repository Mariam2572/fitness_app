import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meal_recommendation.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training_cards.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workout.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workouts_category.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Full Body",
      "Chest",
      "Arm",
      "Shoulder",
      "Back",
      "Legs",
    ];

    return Stack(
      children: [
        const BlurredBackground(imagePath: "assets/images/HomeBg.jpg"),
        SafeArea(
          child: SingleChildScrollView(
            padding:  REdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<HomeViewModel,HomeState>(

                      builder: (context, state) {

                        if(state is HomeLoading){
                          return const Center(child: CircularProgressIndicator());
                        }else if(state is HomeSuccess){
                         return Expanded(
                        child: Text("Hi ${state.userName} ,\n Let's Start Your Day",style: AppTextStyle.instance.textStyle16.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                        ),
                      );
                        }else if(state is HomeError){
                          return Center(child: Text('Error: ${state.message}'));
                        }
                        return const SizedBox.shrink();
                      }
                    ),

                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/images/user.png"), // ← Replace with real user image if available
                    ),
                  ],
                ),


                const SizedBox(height: 20,),

                Text("Category",style: AppTextStyle.instance.textStyle16.copyWith(
                fontWeight: FontWeight.w600
                ),),

                Category(),

                Text("Recommendations Today",style: AppTextStyle.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w600
                ),),

                BlocBuilder<HomeViewModel,HomeState>(
                  builder: (context, state) {
                    if(state is HomeLoading){
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is HomeError){
                      return Center(child: Text(state.message),);
                    }else if(state is HomeSuccess){
                      return WorkoutRecommendation(exercises: state.exercises??[]);
                    }return const Center(child: Text("Error happened"));}
                  ,


                ),

                Row(
                  children:[
                    Expanded(
                      child: Text("Upcoming Workouts",style: AppTextStyle.instance.textStyle16.copyWith(
                        fontWeight: FontWeight.w600
                                        ),
                                        ),
                    ),

                    TextButton(
                        onPressed: (){},
                        child: Text("See All",style: AppTextStyle.instance.textStyle16.copyWith(
                        color: Colors.deepOrange,

                        ),
                        )
                    )
                  ]
                ),

              UpcomingWorkoutsCategory(bodyParts:categories ) ,

               UpcomingWorkout(),

               const SizedBox(height: 20,),
                Row(
                    children:[
                      Expanded(
                        child: Text("Recommendations For You",style: AppTextStyle.instance.textStyle16.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text("See All",style: AppTextStyle.instance.textStyle16.copyWith(
                            color: Colors.deepOrange,
                          ),
                          )
                      )
                    ]
                ),
                MealRecommendation(),
                const SizedBox(height: 20,),
                Text("Popular Training",style: AppTextStyle.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w600
                ),
                ),
                const PopularTraining()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
