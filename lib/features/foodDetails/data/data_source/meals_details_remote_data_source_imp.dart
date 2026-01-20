import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/foodDetails/data/data_source/meals_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MealsDetailsRemoteDataSource)
class MealsDetailsRemoteDataSourceImp implements MealsDetailsRemoteDataSource {
  final MealApiService apiService;
  MealsDetailsRemoteDataSourceImp({required this.apiService});
  @override
  Future<ApiResult<MealsDatailsResponse>> mealsDatails({
    required String id,
  }) async {
    return await apiExecuter<MealsDatailsResponse>(
      () async => await apiService.getMealsDetails(id),
      "",
    );
  }
}
