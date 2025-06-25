import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';

abstract class MealsDetailsRemoteDataSource {
  Future<ApiResult<MealsDatailsResponse>> mealsDatails({required String id});
}
