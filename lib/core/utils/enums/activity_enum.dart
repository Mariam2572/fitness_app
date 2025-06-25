enum ActivityEnum { level1, level2, level3, level4, level5 }

String activityEnumToString(ActivityEnum activityEnum) {
  switch (activityEnum) {
    case ActivityEnum.level1:
      return 'Rookie';
    case ActivityEnum.level2:
      return 'Beginner';
    case ActivityEnum.level3:
      return 'Intermediate';
    case ActivityEnum.level4:
      return 'Advanced';
    case ActivityEnum.level5:
      return 'True Beast';
    default:
      throw ArgumentError('Unknown ActivityEnum value: $activityEnum');
  }
}

activityEnumToBackend(ActivityEnum activityEnum) {
  return activityEnum.toString().split('.').last;
}
