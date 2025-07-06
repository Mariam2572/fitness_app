import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutRecommendation extends StatelessWidget {
  final List<Exercises> exercises;
  final GetAllMusclesByMuscleGroupIdReponse muscles;
  const WorkoutRecommendation({super.key, required this.exercises, required this.muscles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final videoUrl = exercises[index].shortYoutubeDemonstrationLink;
          final image =
              (videoUrl != null && videoUrl.isNotEmpty)
                  ? getYouTubeThumbnail(videoUrl)
                  : "https://img.youtube.com/vi/default.jpg";
          return RecommendationItem(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.exerciseView);
            },
            name: exercises[index].exercise ?? "Exercise Not Found",
            image: image,
          );
        },
      ),
    );
  }
}
