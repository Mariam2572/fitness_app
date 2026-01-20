import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/repos/register_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_use_case_test.mocks.dart';

@GenerateMocks([RegisterRepo])
void main() {
  late RegisterRepo repo;
  final request = RegisterRequest();
  final expected = RegisterResponse();
  setUp(() {
    repo = MockRegisterRepo();
  });
  group('test register use case', () {
    test(
      'when call register use case should call register repo and it should return ApiSuccess<RegisterResponse>',
      () async {
        //arrange
        final result = ApiSuccess<RegisterResponse>(data: expected);
        provideDummy<ApiResult<RegisterResponse>>(result);
        when(repo.register(request)).thenAnswer((_) async => result);
        //act
        final actual = await repo.register(request);
        verify(repo.register(request)).called(1);
        //assert
        expect(actual, result);
      },
    );
    test(
      'when call register use case should call register repo and it should return ApiError<RegisterResponse>',
      () async {
        //arrange
        final expected = ApiError<RegisterResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<RegisterResponse>>(expected);
        when(repo.register(request)).thenAnswer((_) async => expected);
        //act
        final actual = await repo.register(request);
        verify(repo.register(request)).called(1); // verify method called once
        //assert
        expect(actual, isA<ApiError<RegisterResponse>>());
      },
    );
  });
}
