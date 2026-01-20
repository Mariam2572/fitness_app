enum ActivityEnum { level1, level2, level3, level4, level5 }

String activityEnumToString(ActivityEnum? activityEnum) {
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

ActivityEnum? stringToActivityEnum(String? value) {
  switch (value) {
    case 'level1':
      return ActivityEnum.level1;
    case 'level2':
      return ActivityEnum.level2;
    case 'level3':
      return ActivityEnum.level3;
    case 'level4':
      return ActivityEnum.level4;
    case 'level5':
      return ActivityEnum.level5;
    default:
      return null;
  }
}

parseLevelsToActivity(String level) {
  switch (level) {
    case 'level1':
      return 'Rookie';
    case 'level2':
      return 'Beginner';
    case 'level3':
      return 'Intermediate';
    case 'level4':
      return 'Advanced';
    case 'level5':
      return 'True Beast';

    default:
  }
}

activityEnumToBackend(ActivityEnum? activityEnum) {
  return activityEnum.toString().split('.').last;
}
