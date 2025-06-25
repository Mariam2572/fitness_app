import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
class ExerciseImage extends StatelessWidget {
  const ExerciseImage({
    super.key,
    required this.thumbnailUrl,
  });

  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      clipBehavior: Clip.antiAlias,
      child:
          thumbnailUrl.isNotEmpty
              ? CachedNetworkImage(
                imageUrl: thumbnailUrl,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainRed,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
              )
              : const Center(child: Icon(Icons.error, color: Colors.red)),
    );
  }
}