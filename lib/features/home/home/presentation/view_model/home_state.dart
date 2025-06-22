import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Exercises>? exercises;
  final String userName;

  HomeSuccess({required this.userName, this.exercises});

  @override
  List<Object?> get props => [userName, exercises];
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
