import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/logout/domain/repositories/logout_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_repository_impl_test.mocks.dart';

@GenerateMocks([LogoutRepository])
void main() {
  late LogoutRepository repo;
  setUp(() {
    repo = MockLogoutRepository();
  });
  group('test logout repository', () {
    test(
      'when call logout repository should call logout repo and it should return ApiSuccess<String>',
      () async {
        //arrange
        const result = ApiSuccess<String>(data: 'success');
        provideDummy<ApiResult<String>>(result);
        when(
          repo.logout(),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.logout();
        //assert
        verify(repo.logout()).called(1);
        expect(actual, result);
      },
    );
    test(
      'when call logout repository should call get exercise repo and it should return ApiError<String>',
      () async {
        //arrange
        final expectedLevel = ApiError<String>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<String>>(expectedLevel);

        when(
          repo.logout(),
        ).thenAnswer((_) async => expectedLevel);
        //act
        final actual = await repo.logout();
        //assert
        verify(repo.logout()).called(1);
        expect(actual, isA<ApiError<String>>());
      },
    );
  });}