import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';

sealed class MealsDetailsState extends Equatable {
  const MealsDetailsState();

  @override
  List<Object> get props => [];
}

final class MealsDetailsInitial extends MealsDetailsState {}

final class MealsDetailsLoading extends MealsDetailsState {}

final class MealsDetailsSuccess extends MealsDetailsState {
  final MealsDatailsResponse response;
  const MealsDetailsSuccess(this.response);
  @override
  List<Object> get props => [response];
}

final class MealsDetailsFailure extends MealsDetailsState {
  final String error;
  const MealsDetailsFailure(this.error);
  @override
  List<Object> get props => [error];
}
