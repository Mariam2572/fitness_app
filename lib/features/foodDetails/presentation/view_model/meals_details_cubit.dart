import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/foodDetails/domain/usecases/meals_details_usecase.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_state.dart';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  MealsDetailsCubit(this.mealsDetailsUsecase) : super(MealsDetailsInitial());

  final MealsDetailsUsecase mealsDetailsUsecase;

  Future<void> doIntent(MealsDetailsIntent intent) async {
    if (intent is PerformMealsDetails) {
      await _handleMealsDetails(intent);
    }
  }

  Future<void> _handleMealsDetails(PerformMealsDetails intent) async {
    emit(MealsDetailsLoading());
    final response = await mealsDetailsUsecase.invoke(id: intent.id);

    switch (response) {
      case ApiError<MealsDatailsResponse>():
        emit(
          MealsDetailsFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<MealsDatailsResponse>():
        emit(MealsDetailsSuccess(response.data!));
      default:
        emit(const MealsDetailsFailure('Unexpected error occurred'));
        break;
    }
  }
}

sealed class MealsDetailsIntent {}

class PerformMealsDetails extends MealsDetailsIntent {
  final String id;

  PerformMealsDetails({required this.id});
}
