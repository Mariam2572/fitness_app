import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/data/data_source/change_password_data_source.dart';
import 'package:fitness_app/features/auth/change%20password/data/repo/change_password_repo_imp.dart';

import 'package:fitness_app/features/auth/change%20password/domain/repo/change_pssword_repo.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_pssword_repo_test.mocks.dart';

@GenerateMocks([ChangePasswordRemoteDataSource])
void main() {
  late ChangePasswordRepo repo;
  late MockChangePasswordRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockChangePasswordRemoteDataSource();
    repo = ChangePasswordRepoImpl(mockDataSource);
  });

  group("ChangePasswordRepoImpl", () {
    final request = ChangePasswordRequest(
      password: 'oldPass',
      newPassword: 'newPass',
    );
    final response = ChangePasswordResponse(
      message: 'Password updated',
      token: 'new-token',
    );

    test('should return ApiSuccess from data source', () async {
      final expected = ApiSuccess<ChangePasswordResponse>(data: response);
      provideDummy<ApiResult<ChangePasswordResponse>>(expected);

      when(
        mockDataSource.changePassword(request: request),
      ).thenAnswer((_) async => expected);

      final actual = await repo.changePassword(request: request);

      verify(mockDataSource.changePassword(request: request)).called(1);
      expect(actual, equals(expected));
    });

    test('should return ApiError when data source fails', () async {
      final expected = ApiError<ChangePasswordResponse>(
        message: 'Unauthorized',
        failure: ServerFailure(errorMessage: 'Unauthorized'),
      );
      provideDummy<ApiResult<ChangePasswordResponse>>(
        ApiError<ChangePasswordResponse>(
          message: '',
          failure: ServerFailure(errorMessage: ''),
        ),
      );

      when(
        mockDataSource.changePassword(request: request),
      ).thenAnswer((_) async => expected);

      final actual = await repo.changePassword(request: request);

      verify(mockDataSource.changePassword(request: request)).called(1);
      expect(actual, equals(expected));
    });
  });
}
