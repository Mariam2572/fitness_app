import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_usecase_test.mocks.dart';

@GenerateMocks([
  HomeRepo,
  GetAllMusclesGroupsUseCase,
  GetAllMusclesByMuscleGroupIdUseCase,
  GetProfileDataUseCase,
])
void main() {
  late MockHomeRepo mockHomeRepo;
  late MockGetAllMusclesGroupsUseCase mockGetAllMusclesGroupsUseCase;
  late MockGetAllMusclesByMuscleGroupIdUseCase
  mockGetAllMusclesByMuscleGroupIdUseCase;
  late MockGetProfileDataUseCase mockGetProfileDataUseCase;
  late HomeUseCase homeUseCase;

  provideDummy<ApiResult<String>>(ApiError(message: 'Dummy error'));

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    mockGetAllMusclesGroupsUseCase = MockGetAllMusclesGroupsUseCase();
    mockGetAllMusclesByMuscleGroupIdUseCase =
        MockGetAllMusclesByMuscleGroupIdUseCase();
    mockGetProfileDataUseCase = MockGetProfileDataUseCase();
    homeUseCase = HomeUseCase(
      mockHomeRepo,
      mockGetAllMusclesGroupsUseCase,
      mockGetAllMusclesByMuscleGroupIdUseCase,
      mockGetProfileDataUseCase,
    );
  });

  group('HomeUseCase Test', () {
    test(
      'get userName function returns apiSuccess with the userName',
      () async {
        //Arrange
        const userName = "James";
        final expected = ApiSuccess<String>(data: userName);
        when(
          mockHomeRepo.getCurrentUserName(),
        ).thenAnswer((_) async => expected);
        //Act
        final result = await homeUseCase.getUserName();

        //Assert
        expect(result, isA<ApiSuccess<String>>());
        expect((result as ApiSuccess<String>).data, userName);
        verify(mockHomeRepo.getCurrentUserName()).called(1);
      },
    );
    test('getUserName returns ApiError on failure', () async {
      // Arrange
      final expected = ApiError<String>(message: 'Error occurred');
      when(mockHomeRepo.getCurrentUserName()).thenAnswer((_) async => expected);

      // Act
      final result = await homeUseCase.getUserName();

      // Assert
      expect(result, isA<ApiError<String>>());
      verify(mockHomeRepo.getCurrentUserName()).called(1);
    });
  });
}
