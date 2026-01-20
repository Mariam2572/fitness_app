import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/foodDetails/domain/repository_contract/meals_details_contract.dart';

import 'package:injectable/injectable.dart';

@injectable
class MealsDetailsUsecase {
  final MealsDetailsContract mealsDetailsContract;

  MealsDetailsUsecase({required this.mealsDetailsContract});

  Future<ApiResult<MealsDatailsResponse>> invoke({required String id}) async {
    return await mealsDetailsContract.mealsDatails(id: id);
  }
}
