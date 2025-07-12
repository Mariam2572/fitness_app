import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/data_source/exercise_remote_data_source_impl.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../auth/register/data/data_source/register_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])

void main() {
  late MockApiService mockApiService;
  late ExerciseRemoteDataSourceImpl exercisDataSource;

  setUp(() {
    mockApiService = MockApiService();
    exercisDataSource = ExerciseRemoteDataSourceImpl(mockApiService);
  });

  group('ExerciseRemoteDataSourceImpl', () {
    test('should return success ApiResult when getLevelsByMuscles succeeds', () async {
      when(mockApiService.getLevelsByMuscles('12346')).thenAnswer((_) async => LevelsByMusclesModel(message: 'success'));

      final result = await exercisDataSource.getLevelsByMuscles(primeMoverMuscleId: '12346');

      expect(result, isA<ApiSuccess<LevelsByMusclesModel>>());
      expect((result as ApiSuccess).data.message, equals('success'));
      verify(mockApiService.getLevelsByMuscles('12346')).called(1);
    });

    test(
      'should return failure ApiResult when.getLevelsByMuscles throws exception',
      () async {
        when(
          mockApiService.getLevelsByMuscles('12346'),
        ).thenThrow(Exception('Registration failed'));

        final result = await exercisDataSource.getLevelsByMuscles(primeMoverMuscleId: '12346');

        expect(result, isA<ApiError<LevelsByMusclesModel>>());
        verify(mockApiService.getLevelsByMuscles('12346')).called(1);
      },
    );
  });
  group('ExerciseRemoteDataSourceImpl', () {
    test('should return success ApiResult when getExerciseByMoverAndDifficulty succeeds', () async {
      when(mockApiService.getExerciseByMoverAndDifficulty('12346','123')).thenAnswer((_) async => const ExerciseByPrimeMoverAndDifficultyResponse(message: 'success'));

      final result = await exercisDataSource.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '12346', difficultyLevelId: '123');
      expect(result, isA<ApiSuccess<ExerciseByPrimeMoverAndDifficultyResponse>>());
      expect((result as ApiSuccess).data.message, equals('success'));
      verify(mockApiService.getExerciseByMoverAndDifficulty('12346','123')).called(1);
    });

    test(
      'should return failure ApiResult when.getExerciseByMoverAndDifficulty throws exception',
      () async {
        when(
          mockApiService.getExerciseByMoverAndDifficulty('12346','123'),
        ).thenThrow(Exception('Registration failed'));

        final result = await exercisDataSource.getExerciseByMoverAndDifficultyLevel(primeMoverMuscleId: '12346', difficultyLevelId: '123');

        expect(result, isA<ApiError<ExerciseByPrimeMoverAndDifficultyResponse>>());
        verify(mockApiService.getExerciseByMoverAndDifficulty('12346','123')).called(1);
      },
    );
  });

}
