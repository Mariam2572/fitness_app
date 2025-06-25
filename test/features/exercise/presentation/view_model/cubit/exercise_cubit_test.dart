import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_exercise_by_mover_and_difficulty_level.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exercise_cubit_test.mocks.dart';

@GenerateMocks([
  GetExerciseByMoverAndDifficultyLevelUseCase,
  GetLevelsByPrimeMoverMuscleUseCases,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('test exercise cubit', () {
    late ExerciseCubit exerciseCubit;
    late GetExerciseByMoverAndDifficultyLevelUseCase
    getExerciseByMoverAndDifficultyLevelUseCase;
    late GetLevelsByPrimeMoverMuscleUseCases
    getLevelsByPrimeMoverMuscleUseCases;
    setUp(() {
      getExerciseByMoverAndDifficultyLevelUseCase =
          MockGetExerciseByMoverAndDifficultyLevelUseCase();
      getLevelsByPrimeMoverMuscleUseCases =
          MockGetLevelsByPrimeMoverMuscleUseCases();
      exerciseCubit = ExerciseCubit(
        getLevelsByPrimeMoverMuscleUseCases,
        getExerciseByMoverAndDifficultyLevelUseCase,
      );
    });
    final levelresponse = LevelsByMusclesModel(difficultyLevels: []);
    const exerciseResponse = ExerciseByPrimeMoverAndDifficultyResponse(
      exercises: [],
    );
        final exepectedLevelResponse = ApiSuccess<LevelsByMusclesModel>(
      data: levelresponse,
    );
        const expectedExerciseResponse =
        ApiSuccess<ExerciseByPrimeMoverAndDifficultyResponse>(
          data: exerciseResponse,
        );
    blocTest<ExerciseCubit, ExerciseState>(
      'when call doIntent with GetLevelsByPrimeMoverMusclesIntent then call getLevelsByPrimeMoverMuscleUseCases and emit ExerciseSuccess',
      
      build: () {
    
        provideDummy<ApiResult<LevelsByMusclesModel>>(exepectedLevelResponse);
        provideDummy<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>(
          expectedExerciseResponse,
        );
        when(
          getLevelsByPrimeMoverMuscleUseCases(primeMoverMuscleId: '123456'),
        ).thenAnswer((_) async => exepectedLevelResponse);
        when(
          getExerciseByMoverAndDifficultyLevelUseCase(
            primeMoverMuscleId: '123456',
            difficultyLevelId: '123456',
          ),
        ).thenAnswer((_) async => expectedExerciseResponse);

        return exerciseCubit;
      },

      act:
          (bloc) {
            bloc.doIntent(
              GetLevelsByPrimeMoverMusclesIntent(
                primeMoverMuscleId: '123456',
              ),
            );
            bloc.doIntent(
              GetExerciseByMoverAndDifficulty(
                primeMoverMuscleId: '123456',
                difficultyLevelId: '123456',
              ),
            );
          },
      expect:
          () => [
            ExerciseLoading(),
            ExerciseSuccess(
              levelsByMusclesModel: exepectedLevelResponse.data,
              exerciseByPrimeMoverAndDifficultyResponse:
                  expectedExerciseResponse.data,
            ),
          ],
      verify: (bloc) {
        verify(
          getLevelsByPrimeMoverMuscleUseCases(primeMoverMuscleId: '123456'),
        ).called(1);
        verify(
          getExerciseByMoverAndDifficultyLevelUseCase(
            primeMoverMuscleId: '123456',
            difficultyLevelId: '123456',
          ),
        ).called(1);
      },
    );
    blocTest<ExerciseCubit, ExerciseState>('when call doIntent with GetLevelsByPrimeMoverMusclesIntent then call getLevelsByPrimeMoverMuscleUseCases and emit ExerciseFailure',
     build: () {
          final exepectedLevelResponse = ApiError<LevelsByMusclesModel>(
      failure: ServerFailure(errorMessage: 'request failed'),
    );
        final expectedExerciseResponse =
        ApiError<ExerciseByPrimeMoverAndDifficultyResponse>(
      failure: ServerFailure(errorMessage: 'request failed'),
        );
        provideDummy<ApiResult<LevelsByMusclesModel>>(exepectedLevelResponse);
        provideDummy<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>(
          expectedExerciseResponse,
        );
        when(
          getLevelsByPrimeMoverMuscleUseCases(primeMoverMuscleId: '123456'),
        ).thenAnswer((_) async => exepectedLevelResponse);
        when(
          getExerciseByMoverAndDifficultyLevelUseCase(
            primeMoverMuscleId: '123456',
            difficultyLevelId: '123456',
          ),
        ).thenAnswer((_) async => expectedExerciseResponse);

        return exerciseCubit;
      },
      act:
          (bloc) {
            bloc.doIntent(
              GetLevelsByPrimeMoverMusclesIntent(
                primeMoverMuscleId: '123456',
              ),
            );
            bloc.doIntent(
              GetExerciseByMoverAndDifficulty(
                primeMoverMuscleId: '123456',
                difficultyLevelId: '123456',
              ),
            );
          },
      expect:
          () => [
            ExerciseLoading(),
            const ExerciseFailuer(message: 'An error occurred , try later'),
          ], 
      );
  });
}
