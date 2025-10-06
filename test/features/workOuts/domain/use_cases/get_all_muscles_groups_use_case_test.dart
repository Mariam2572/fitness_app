import 'package:fitness_app/features/workOuts/domain/repos/work_outs_repo.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'get_all_muscles_groups_use_case_test.mocks.dart';

@GenerateMocks([WorkOutsRepo])
void main() {
  late GetAllMusclesGroupsUseCase getAllMusclesGroupsUseCase;
  late WorkOutsRepo mockWorkOut;
  setUp(() {
    mockWorkOut = MockWorkOutsRepo();
        getAllMusclesGroupsUseCase = GetAllMusclesGroupsUseCase(mockWorkOut);
  });
}
