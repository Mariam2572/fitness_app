import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_details_section.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/features/exercise/presentation/views/exercise_view_body.dart';

class MockExerciseCubit extends Mock implements ExerciseCubit {}

void main() {
  late MockExerciseCubit mockCubit;

  setUp(() {
    mockCubit = MockExerciseCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ExerciseCubit>.value(
        value: mockCubit,
        child: const ExerciseViewBody(),
      ),
    );
  }

  testWidgets('shows error message when ExerciseFailuer state', (
    WidgetTester tester,
  ) async {
    when(
      () => mockCubit.state,
    ).thenReturn(ExerciseFailuer(message: 'Failed to load'));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Failed to load'), findsOneWidget);
  });
  testWidgets('shows loading indicator at start', (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(ExerciseLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error message when ExerciseFailuer state', (
    WidgetTester tester,
  ) async {
    when(
      () => mockCubit.state,
    ).thenReturn(const ExerciseFailuer(message: 'Failed to load'));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Failed to load'), findsOneWidget);
  });

  testWidgets('shows list of exercises when ExerciseSuccess state', (
    WidgetTester tester,
  ) async {
    when(() => mockCubit.state).thenReturn(
      const ExerciseSuccess(
        exerciseByPrimeMoverAndDifficultyResponse:
            ExerciseByPrimeMoverAndDifficultyResponse(
              exercises: [
                Exercise(
                  id: '1',
                  exercise: 'Push Up',
                  difficultyLevel: 'Beginner',
                  primeMoverMuscle: 'Chest',
                ),
                Exercise(
                  id: '2',
                  exercise: 'Pull Up',
                  difficultyLevel: 'Beginner',
                  primeMoverMuscle: 'Back',
                ),
              ],
            ),
      ),
    );

    when(() => mockCubit.levels).thenReturn([]);
    when(
      () => mockCubit.tabController,
    ).thenReturn(TabController(length: 0, vsync: const TestVSync()));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); // rebuild after state

    expect(find.byType(ExerciseDetailsSection), findsOneWidget);
    expect(find.byType(ExerciseWidgetItem), findsNWidgets(2));
    expect(find.text('Push Up'), findsOneWidget);
    expect(find.text('Pull Up'), findsOneWidget);
  });
}
