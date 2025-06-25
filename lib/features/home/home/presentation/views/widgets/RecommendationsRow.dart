
import 'package:fitness_app/core/utils/helper_func/youtube_thumbnail.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationsRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 104.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RecommendationItem(name: "Jogging", image:getYouTubeThumbnail("https://youtu.be/Sa4ZWmnSC5o") ),
          const RecommendationItem(name: "Jogging", image:"assets/images/homeGym.png" ),
          const RecommendationItem(name: "Jogging", image:"assets/images/homeGym.png" ),
          const RecommendationItem(name: "Jogging", image:"assets/images/homeGym.png" ),
          const RecommendationItem(name: "Jogging", image:"assets/images/homeGym.png" ),
          const RecommendationItem(name: "Jogging", image:"assets/images/homeGym.png" ),
        ],
      ),
    );

  }


}