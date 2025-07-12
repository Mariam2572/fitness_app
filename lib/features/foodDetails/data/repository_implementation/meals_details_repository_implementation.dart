import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/foodDetails/data/data_source/meals_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/foodDetails/domain/repository_contract/meals_details_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MealsDetailsContract)
class MealsDetailsRepositoryImplementation implements MealsDetailsContract {
  final MealsDetailsRemoteDataSource mealsDetailsRemoteDataSource;
  MealsDetailsRepositoryImplementation({
    required this.mealsDetailsRemoteDataSource,
  });
  @override
  Future<ApiResult<MealsDatailsResponse>> mealsDatails({
    required String id,
  }) async {
    return await mealsDetailsRemoteDataSource.mealsDatails(id: id);
  }
}
