import 'Exercises.dart';

/// message : "success"
/// totalExercises : 5
/// exercises : [{"_id":"67cfa4ffc1b27e475670739f","exercise":"Stability Ball Sit Up","short_youtube_demonstration":"Video Demonstration","in_depth_youtube_explanation":"Video Explanation","difficulty_level":"Beginner","target_muscle_group":"Abdominals","prime_mover_muscle":"Rectus Abdominis","secondary_muscle":null,"tertiary_muscle":null,"primary_equipment":"Stability Ball","_primary_items":1,"secondary_equipment":null,"_secondary_items":0,"posture":"Supine","single_or_double_arm":"No Arms","continuous_or_alternating_arms":"Continuous","grip":"Head Supported","load_position_ending":"No Load","continuous_or_alternating_legs":"Continuous","foot_elevation":"No Elevation","combination_exercises":"Single Exercise","movement_pattern_1":"Spinal Flexion","movement_pattern_2":"Other","movement_pattern_3":null,"plane_of_motion_1":"Sagittal Plane","plane_of_motion_2":null,"plane_of_motion_3":null,"body_region":"Midsection","force_type":"Other","mechanics":null,"laterality":"Bilateral","primary_exercise_classification":"Unsorted*","short_youtube_demonstration_link":"https://youtu.be/7L90imlW0es?si=gY7k7XVC43IRrv-N","in_depth_youtube_explanation_link":"https://youtu.be/3aQXaB4PU_A"},{"_id":"67cfa4ffc1b27e4756707c9e","exercise":"Bodyweight Crunch","short_youtube_demonstration":"Video Demonstration","in_depth_youtube_explanation":"Video Explanation","difficulty_level":"Beginner","target_muscle_group":"Abdominals","prime_mover_muscle":"Rectus Abdominis","secondary_muscle":null,"tertiary_muscle":null,"primary_equipment":"Bodyweight","_primary_items":1,"secondary_equipment":null,"_secondary_items":0,"posture":"Supine","single_or_double_arm":"No Arms","continuous_or_alternating_arms":"Continuous","grip":"Head Supported","load_position_ending":"No Load","continuous_or_alternating_legs":"Continuous","foot_elevation":"No Elevation","combination_exercises":"Single Exercise","movement_pattern_1":"Spinal Flexion","movement_pattern_2":null,"movement_pattern_3":null,"plane_of_motion_1":"Sagittal Plane","plane_of_motion_2":null,"plane_of_motion_3":null,"body_region":"Midsection","force_type":"Other","mechanics":"Compound","laterality":"Bilateral","primary_exercise_classification":"Unsorted*","short_youtube_demonstration_link":"https://youtu.be/Gala3hWxFTw?si=5Qrh2TKQB1NMQpCG","in_depth_youtube_explanation_link":"https://youtu.be/z6LRile4YiE?si=1_nlGdr2ALt1LXF2"},{"_id":"67cfa505c1b27e4756707ce1","exercise":"Bodyweight Supine Alternating Single Leg Raise","short_youtube_demonstration":"Video Demonstration","in_depth_youtube_explanation":"Video Explanation","difficulty_level":"Beginner","target_muscle_group":"Abdominals","prime_mover_muscle":"Rectus Abdominis","secondary_muscle":null,"tertiary_muscle":null,"primary_equipment":"Bodyweight","_primary_items":1,"secondary_equipment":null,"_secondary_items":0,"posture":"Supine","single_or_double_arm":"No Arms","continuous_or_alternating_arms":"Continuous","grip":"No Grip","load_position_ending":"No Load","continuous_or_alternating_legs":"Alternating","foot_elevation":"No Elevation","combination_exercises":"Single Exercise","movement_pattern_1":"Hip Flexion","movement_pattern_2":null,"movement_pattern_3":null,"plane_of_motion_1":"Sagittal Plane","plane_of_motion_2":null,"plane_of_motion_3":null,"body_region":"Midsection","force_type":"Other","mechanics":"Compound","laterality":"Unilateral","primary_exercise_classification":"Unsorted*","short_youtube_demonstration_link":"https://youtu.be/IUCoqgdvDxU?si=8xtgp1M-mJqke2mR","in_depth_youtube_explanation_link":"https://youtu.be/TJITvui4Wwo"},{"_id":"67cfa505c1b27e4756707ced","exercise":"Stability Ball Kneeling Rollout","short_youtube_demonstration":"Video Demonstration","in_depth_youtube_explanation":"Video Explanation","difficulty_level":"Beginner","target_muscle_group":"Abdominals","prime_mover_muscle":"Rectus Abdominis","secondary_muscle":null,"tertiary_muscle":null,"primary_equipment":"Stability Ball","_primary_items":1,"secondary_equipment":null,"_secondary_items":0,"posture":"Prone","single_or_double_arm":"Double Arm","continuous_or_alternating_arms":"Continuous","grip":"Forearm","load_position_ending":"No Load","continuous_or_alternating_legs":"Continuous","foot_elevation":"No Elevation","combination_exercises":"Single Exercise","movement_pattern_1":"Anti-Extension","movement_pattern_2":null,"movement_pattern_3":null,"plane_of_motion_1":"Sagittal Plane","plane_of_motion_2":null,"plane_of_motion_3":null,"body_region":"Midsection","force_type":"Other","mechanics":"Compound","laterality":"Bilateral","primary_exercise_classification":"Unsorted*","short_youtube_demonstration_link":"https://youtu.be/gi38qGKDzXY?si=XCqiGVtu482eeeTP","in_depth_youtube_explanation_link":"https://youtu.be/2UQx-1dxyY8"},{"_id":"67cfa505c1b27e4756707e2a","exercise":"Stability Ball Oblique Crunch ","short_youtube_demonstration":null,"in_depth_youtube_explanation":"Video Explanation","difficulty_level":"Beginner","target_muscle_group":"Abdominals","prime_mover_muscle":"Obliques","secondary_muscle":null,"tertiary_muscle":null,"primary_equipment":"Stability Ball","_primary_items":1,"secondary_equipment":null,"_secondary_items":0,"posture":"Supine","single_or_double_arm":"No Arms","continuous_or_alternating_arms":"Continuous","grip":"Head Supported","load_position_ending":"No Load","continuous_or_alternating_legs":"Continuous","foot_elevation":"No Elevation","combination_exercises":"Single Exercise","movement_pattern_1":"Rotational","movement_pattern_2":"Spinal Flexion","movement_pattern_3":null,"plane_of_motion_1":"Transverse Plane","plane_of_motion_2":null,"plane_of_motion_3":null,"body_region":"Midsection","force_type":"Other","mechanics":"Compound","laterality":"Bilateral","primary_exercise_classification":"Unsorted*","short_youtube_demonstration_link":null,"in_depth_youtube_explanation_link":"https://youtu.be/1gC-nI0XuZU"}]

class RandomExerciseResponse {
  RandomExerciseResponse({
      this.message, 
      this.totalExercises, 
      this.exercises,});

  RandomExerciseResponse.fromJson(dynamic json) {
    message = json['message'];
    totalExercises = json['totalExercises'];
    if (json['exercises'] != null) {
      exercises = [];
      json['exercises'].forEach((v) {
        exercises?.add(Exercises.fromJson(v));
      });
    }
  }
  String? message;
  num? totalExercises;
  List<Exercises>? exercises;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['totalExercises'] = totalExercises;
    if (exercises != null) {
      map['exercises'] = exercises?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}