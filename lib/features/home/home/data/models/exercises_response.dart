import 'package:fitness_app/features/home/home/data/models/exercises.dart';


class ExercisesResponse {
  ExercisesResponse({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });

  ExercisesResponse.fromJson(dynamic json) {
    message = json['message'];
    totalExercises = json['totalExercises'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    if (json['exercises'] != null) {
      exercises = [];
      json['exercises'].forEach((v) {
        exercises?.add(Exercises.fromJson(v));
      });
    }
  }
  String? message;
  num? totalExercises;
  num? totalPages;
  num? currentPage;
  List<Exercises>? exercises;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['totalExercises'] = totalExercises;
    map['totalPages'] = totalPages;
    map['currentPage'] = currentPage;
    if (exercises != null) {
      map['exercises'] = exercises?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
