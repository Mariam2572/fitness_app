import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/data/repo_impl/exercise_repo_impl.dart';
import 'package:fitness_app/features/exercise/domain/data_source/exercise_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exercise_repo_impl_test.mocks.dart';
@GenerateMocks([ExerciseRemoteDataSource])
void main() {
  late ExerciseRemoteDataSource mockRepo;
  late ExerciseRepoImpl repo;
  setUp(() {
    mockRepo = MockExerciseRemoteDataSource();
    repo = ExerciseRepoImpl(mockRepo);
  });
  group('test levelByMuscles repo impl', () {
    test(
      'when call levelByMuscles repo should call levelByMuscles data source and it should return Apisuccess<ForgetPasswordResponse>',
      () async {
        //arrange
      final  expecetdLevelsByMusclesModel = LevelsByMusclesModel(difficultyLevels: [],message: 'success');
        final result = ApiSuccess<LevelsByMusclesModel>(
          data: expecetdLevelsByMusclesModel,
        );
        provideDummy<ApiResult<LevelsByMusclesModel>>(result);
        when(
          mockRepo.getLevelsByMuscles(primeMoverMuscleId: '1223'),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.getLevelsByMuscles(primeMoverMuscleId: '1223');
        //assert
        verify(mockRepo.getLevelsByMuscles(primeMoverMuscleId: '1223')).called(1);
        expect(actual, result);
      },
    );
    test('should return ApiError when data source fails', () async {
    
      final expected = ApiError<LevelsByMusclesModel>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );

      when(mockRepo.getLevelsByMuscles(primeMoverMuscleId: '1223')).thenAnswer((_) async => expected);

      final actual = await repo.getLevelsByMuscles(primeMoverMuscleId: '1223');

      verify(mockRepo.getLevelsByMuscles(primeMoverMuscleId: '1223')).called(1);
      expect(actual, equals(expected));
    });
  });
  group('test exerciseByLevel repo impl', () {
    test(
      'when call exerciseByLevel repo should call exerciseByLevel data source and it should return Apisuccess<ForgetPasswordResponse>',
      () async {
        //arrange
      const  expecetdExerciseByPrimeMover = ExerciseByPrimeMoverAndDifficultyResponse(exercises: [],message: 'success');
        const  exerciseResult = ApiSuccess<ExerciseByPrimeMoverAndDifficultyResponse>(
          data: expecetdExerciseByPrimeMover,
        );
        provideDummy<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>(exerciseResult);
        when(
          mockRepo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '12354'),
        ).thenAnswer((_) async => exerciseResult);
        //act
        final actual = await repo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '12354');
        //assert
        verify(mockRepo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '12354')).called(1);
        expect(actual, exerciseResult);
      },
    );
    test('should return ApiError when data source fails', () async {
      final expected = ApiError<ExerciseByPrimeMoverAndDifficultyResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
      when(mockRepo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '1123')).thenAnswer((_) async => expected);
      final actual = await repo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '1123');
      verify(mockRepo.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '1233', difficultyLevelId: '1123')).called(1);
      expect(actual, equals(expected));
    });
  });

  }
