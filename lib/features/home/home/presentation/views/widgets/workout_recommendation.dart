import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WorkoutRecommendation extends StatelessWidget{

  List<Exercises> exercises;
  WorkoutRecommendation({required this.exercises});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exercises.length,
       itemBuilder: (context, index) {
         final exerciseName = exercises[index].exercise;
         final videoUrl = exercises[index].shortYoutubeDemonstrationLink;
         final image = getYouTubeThumbnail(videoUrl??"");
         return RecommendationItem(name: exerciseName??"Exercise Not Found", image: image);
       },
      ),
    );

  }

}