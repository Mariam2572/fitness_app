import 'package:equatable/equatable.dart';

import 'exercise.dart';

class ExerciseByPrimeMoverAndDifficultyResponse extends Equatable {
  final String? message;
  final int? totalExercises;
  final int? totalPages;
  final int? currentPage;
  final List<Exercise>? exercises;

  const ExerciseByPrimeMoverAndDifficultyResponse({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });

  factory ExerciseByPrimeMoverAndDifficultyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ExerciseByPrimeMoverAndDifficultyResponse(
      message: json['message'] as String?,
      totalExercises: json['totalExercises'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      exercises:
          (json['exercises'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'totalExercises': totalExercises,
    'totalPages': totalPages,
    'currentPage': currentPage,
    'exercises': exercises?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [message, totalExercises, totalPages, currentPage, exercises];
  }
}
