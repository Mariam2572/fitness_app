import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:fitness_app/features/auth/change%20password/data/data_source/change_password_data_source_imp.dart';

import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../register/data/data_source/register_data_source_impl_test.mocks.dart';
import 'change_password_data_source_imp_test.mocks.dart'
    show MockFlutterSecureStorage;

@GenerateMocks([ApiService, FlutterSecureStorage])
void main() {
  late MockApiService mockApiService;
  late MockFlutterSecureStorage mockSecureStorage;
  late ChangePasswordRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiService = MockApiService();
    mockSecureStorage = MockFlutterSecureStorage();
    secureStorage = mockSecureStorage;

    dataSource = ChangePasswordRemoteDataSourceImpl(mockApiService);
  });

  group('ChangePasswordRemoteDataSourceImpl', () {
    final request = ChangePasswordRequest(password: 'old', newPassword: 'new');
    final response = ChangePasswordResponse(
      message: 'success',
      token: 'mock-token',
    );

    test(
      'should return success ApiResult when changePassword succeeds',
      () async {
        when(
          mockSecureStorage.read(key: Constants.userToken),
        ).thenAnswer((_) async => 'testToken');

        when(
          mockApiService.changePassword(request, 'Bearer testToken'),
        ).thenAnswer((_) async => response);

        final result = await dataSource.changePassword(request: request);

        expect(result, isA<ApiSuccess<ChangePasswordResponse>>());
        expect((result as ApiSuccess).data, equals(response));
        verify(mockSecureStorage.read(key: Constants.userToken)).called(1);
        verify(
          mockApiService.changePassword(request, 'Bearer testToken'),
        ).called(1);
      },
    );

    test('should return error ApiResult when token is missing', () async {
      when(
        mockSecureStorage.read(key: Constants.userToken),
      ).thenAnswer((_) async => null);

      final result = await dataSource.changePassword(request: request);

      expect(result, isA<ApiError<ChangePasswordResponse>>());
      expect((result as ApiError).message, "Token is missing");
      verify(mockSecureStorage.read(key: Constants.userToken)).called(1);
      verifyNever(mockApiService.changePassword(any, any));
    });
  });
}
