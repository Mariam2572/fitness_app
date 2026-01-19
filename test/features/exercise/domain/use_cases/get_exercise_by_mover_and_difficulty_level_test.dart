import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/repos/exercise_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_exercise_by_mover_and_difficulty_level_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  late ExerciseRepo repo;

  final expectedLevel = LevelsByMusclesModel(
    difficultyLevels: [],
    message: 'success',
  );
  setUp(() {
    repo = MockExerciseRepo();
  });
  group('test exercise use case', () {
    test(
      'when call exercise use case should call exercise repo and it should return ApiSuccess<exerciseResponse>',
      () async {
        //arrange
        final result = ApiSuccess<LevelsByMusclesModel>(data: expectedLevel);
        provideDummy<ApiResult<LevelsByMusclesModel>>(result);
        when(
          repo.getLevelsByMuscles(primeMoverMuscleId: '1234'),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.getLevelsByMuscles(
          primeMoverMuscleId: '1234',
        );
        //assert
        verify(repo.getLevelsByMuscles(primeMoverMuscleId: '1234')).called(1);
        expect(actual, result);
      },
    );
    test(
      'when call get exercise use case should call get exercise repo and it should return ApiError<LevelsByMusclesModel>',
      () async {
        //arrange
        final expectedLevel = ApiError<LevelsByMusclesModel>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<LevelsByMusclesModel>>(expectedLevel);

        when(
          repo.getLevelsByMuscles(primeMoverMuscleId: '1234'),
        ).thenAnswer((_) async => expectedLevel);
        //act
        final actual = await repo.getLevelsByMuscles(
          primeMoverMuscleId: '1234',
        );
        //assert
        verify(repo.getLevelsByMuscles(primeMoverMuscleId: '1234')).called(1);
        expect(actual, isA<ApiError<LevelsByMusclesModel>>());
      },
    );
  });
  group('test get exercise use case', () {
    test(
      'when call get exercise use case should call get exercise repo and it should return ApiSuccess<get exerciseResponse>',
      () async {
        //arrange
        const expected = ExerciseByPrimeMoverAndDifficultyResponse(
          exercises: [],
          message: 'success',
        );
        const result = ApiSuccess<ExerciseByPrimeMoverAndDifficultyResponse>(
          data: expected,
        );
        provideDummy<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>(
          result,
        );
        when(
          repo.getExerciseByMoverAndDifficultyLevel(
            primeMoverMuscleId: '1223',
            difficultyLevelId: '1233',
          ),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.getExerciseByMoverAndDifficultyLevel(
          primeMoverMuscleId: '1223',
          difficultyLevelId: '1233',
        );
        //assert
        verify(
          repo.getExerciseByMoverAndDifficultyLevel(
            primeMoverMuscleId: '1223',
            difficultyLevelId: '1233',
          ),
        ).called(1);
        expect(actual, result);
      },
    );
    test(
      'when call get exercise use case should call get exercise repo and it should return ApiError<ExerciseByPrimeMoverAndDifficultyResponse>',
      () async {
        //arrange
        final expected = ApiError<ExerciseByPrimeMoverAndDifficultyResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>(
          expected,
        );

        when(
          repo.getExerciseByMoverAndDifficultyLevel(
            primeMoverMuscleId: '1223',
            difficultyLevelId: '1233',
          ),
        ).thenAnswer((_) async => expected);
        //act
        final actual = await repo.getExerciseByMoverAndDifficultyLevel(
          primeMoverMuscleId: '1223',
          difficultyLevelId: '1233',
        );
        //assert
        verify(
          repo.getExerciseByMoverAndDifficultyLevel(
            primeMoverMuscleId: '1223',
            difficultyLevelId: '1233',
          ),
        ).called(1);
        expect(
          actual,
          isA<ApiError<ExerciseByPrimeMoverAndDifficultyResponse>>(),
        );
      },
    );
  });
}
