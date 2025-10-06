/// _id : "67cfa4ffc1b27e475670739f"
/// exercise : "Stability Ball Sit Up"
/// short_youtube_demonstration : "Video Demonstration"
/// in_depth_youtube_explanation : "Video Explanation"
/// difficulty_level : "Beginner"
/// target_muscle_group : "Abdominals"
/// prime_mover_muscle : "Rectus Abdominis"
/// secondary_muscle : null
/// tertiary_muscle : null
/// primary_equipment : "Stability Ball"
/// _primary_items : 1
/// secondary_equipment : null
/// _secondary_items : 0
/// posture : "Supine"
/// single_or_double_arm : "No Arms"
/// continuous_or_alternating_arms : "Continuous"
/// grip : "Head Supported"
/// load_position_ending : "No Load"
/// continuous_or_alternating_legs : "Continuous"
/// foot_elevation : "No Elevation"
/// combination_exercises : "Single Exercise"
/// movement_pattern_1 : "Spinal Flexion"
/// movement_pattern_2 : "Other"
/// movement_pattern_3 : null
/// plane_of_motion_1 : "Sagittal Plane"
/// plane_of_motion_2 : null
/// plane_of_motion_3 : null
/// body_region : "Midsection"
/// force_type : "Other"
/// mechanics : null
/// laterality : "Bilateral"
/// primary_exercise_classification : "Unsorted*"
/// short_youtube_demonstration_link : "https://youtu.be/7L90imlW0es?si=gY7k7XVC43IRrv-N"
/// in_depth_youtube_explanation_link : "https://youtu.be/3aQXaB4PU_A"

class Exercises {
  Exercises({
      this.id, 
      this.exercise, 
      this.shortYoutubeDemonstration, 
      this.inDepthYoutubeExplanation, 
      this.difficultyLevel, 
      this.targetMuscleGroup, 
      this.primeMoverMuscle, 
      this.secondaryMuscle, 
      this.tertiaryMuscle, 
      this.primaryEquipment, 
      this.primaryItems, 
      this.secondaryEquipment, 
      this.secondaryItems, 
      this.posture, 
      this.singleOrDoubleArm, 
      this.continuousOrAlternatingArms, 
      this.grip, 
      this.loadPositionEnding, 
      this.continuousOrAlternatingLegs, 
      this.footElevation, 
      this.combinationExercises, 
      this.movementPattern1, 
      this.movementPattern2, 
      this.movementPattern3, 
      this.planeOfMotion1, 
      this.planeOfMotion2, 
      this.planeOfMotion3, 
      this.bodyRegion, 
      this.forceType, 
      this.mechanics, 
      this.laterality, 
      this.primaryExerciseClassification, 
      this.shortYoutubeDemonstrationLink, 
      this.inDepthYoutubeExplanationLink,});

  Exercises.fromJson(dynamic json) {
    id = json['_id'];
    exercise = json['exercise'];
    shortYoutubeDemonstration = json['short_youtube_demonstration'];
    inDepthYoutubeExplanation = json['in_depth_youtube_explanation'];
    difficultyLevel = json['difficulty_level'];
    targetMuscleGroup = json['target_muscle_group'];
    primeMoverMuscle = json['prime_mover_muscle'];
    secondaryMuscle = json['secondary_muscle'];
    tertiaryMuscle = json['tertiary_muscle'];
    primaryEquipment = json['primary_equipment'];
    primaryItems = json['_primary_items'];
    secondaryEquipment = json['secondary_equipment'];
    secondaryItems = json['_secondary_items'];
    posture = json['posture'];
    singleOrDoubleArm = json['single_or_double_arm'];
    continuousOrAlternatingArms = json['continuous_or_alternating_arms'];
    grip = json['grip'];
    loadPositionEnding = json['load_position_ending'];
    continuousOrAlternatingLegs = json['continuous_or_alternating_legs'];
    footElevation = json['foot_elevation'];
    combinationExercises = json['combination_exercises'];
    movementPattern1 = json['movement_pattern_1'];
    movementPattern2 = json['movement_pattern_2'];
    movementPattern3 = json['movement_pattern_3'];
    planeOfMotion1 = json['plane_of_motion_1'];
    planeOfMotion2 = json['plane_of_motion_2'];
    planeOfMotion3 = json['plane_of_motion_3'];
    bodyRegion = json['body_region'];
    forceType = json['force_type'];
    mechanics = json['mechanics'];
    laterality = json['laterality'];
    primaryExerciseClassification = json['primary_exercise_classification'];
    shortYoutubeDemonstrationLink = json['short_youtube_demonstration_link'];
    inDepthYoutubeExplanationLink = json['in_depth_youtube_explanation_link'];
  }
  String? id;
  String? exercise;
  String? shortYoutubeDemonstration;
  String? inDepthYoutubeExplanation;
  String? difficultyLevel;
  String? targetMuscleGroup;
  String? primeMoverMuscle;
  dynamic secondaryMuscle;
  dynamic tertiaryMuscle;
  String? primaryEquipment;
  num? primaryItems;
  dynamic secondaryEquipment;
  num? secondaryItems;
  String? posture;
  String? singleOrDoubleArm;
  String? continuousOrAlternatingArms;
  String? grip;
  String? loadPositionEnding;
  String? continuousOrAlternatingLegs;
  String? footElevation;
  String? combinationExercises;
  String? movementPattern1;
  String? movementPattern2;
  dynamic movementPattern3;
  String? planeOfMotion1;
  dynamic planeOfMotion2;
  dynamic planeOfMotion3;
  String? bodyRegion;
  String? forceType;
  dynamic mechanics;
  String? laterality;
  String? primaryExerciseClassification;
  String? shortYoutubeDemonstrationLink;
  String? inDepthYoutubeExplanationLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['exercise'] = exercise;
    map['short_youtube_demonstration'] = shortYoutubeDemonstration;
    map['in_depth_youtube_explanation'] = inDepthYoutubeExplanation;
    map['difficulty_level'] = difficultyLevel;
    map['target_muscle_group'] = targetMuscleGroup;
    map['prime_mover_muscle'] = primeMoverMuscle;
    map['secondary_muscle'] = secondaryMuscle;
    map['tertiary_muscle'] = tertiaryMuscle;
    map['primary_equipment'] = primaryEquipment;
    map['_primary_items'] = primaryItems;
    map['secondary_equipment'] = secondaryEquipment;
    map['_secondary_items'] = secondaryItems;
    map['posture'] = posture;
    map['single_or_double_arm'] = singleOrDoubleArm;
    map['continuous_or_alternating_arms'] = continuousOrAlternatingArms;
    map['grip'] = grip;
    map['load_position_ending'] = loadPositionEnding;
    map['continuous_or_alternating_legs'] = continuousOrAlternatingLegs;
    map['foot_elevation'] = footElevation;
    map['combination_exercises'] = combinationExercises;
    map['movement_pattern_1'] = movementPattern1;
    map['movement_pattern_2'] = movementPattern2;
    map['movement_pattern_3'] = movementPattern3;
    map['plane_of_motion_1'] = planeOfMotion1;
    map['plane_of_motion_2'] = planeOfMotion2;
    map['plane_of_motion_3'] = planeOfMotion3;
    map['body_region'] = bodyRegion;
    map['force_type'] = forceType;
    map['mechanics'] = mechanics;
    map['laterality'] = laterality;
    map['primary_exercise_classification'] = primaryExerciseClassification;
    map['short_youtube_demonstration_link'] = shortYoutubeDemonstrationLink;
    map['in_depth_youtube_explanation_link'] = inDepthYoutubeExplanationLink;
    return map;
  }

}