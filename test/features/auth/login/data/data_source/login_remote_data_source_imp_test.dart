import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_remote_data_source_imp.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../register/data/data_source/register_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService mockApiService;
  late LoginRemoteDataSource loginRemoteDataSource;
  final loginRequest = LoginRequest(
    email: "sam@gmail.com",
    password: "Sam@1234",
  );
  group("test LoginRemoteDataSourceImpl", () {
    setUpAll(() {
      mockApiService = MockApiService();
      loginRemoteDataSource = LoginRemoteDataSourceImp(
        apiService: mockApiService,
      );
    });
    test(
      "should successfully login and return LoginResponse when API call succeeds",
      () async {
        final loginResponse = LoginResponse(
          message: "success",
          user: UserData(
            id: "1",
            firstName: "sam",
            lastName: "sam",
            email: "sam@gmail.com",
            gender: "male",
            height: 180,
            weight: 75,
            age: 25,
          ),
          token: "token123",
        );
        when(
          mockApiService.loginUser(loginRequest),
        ).thenAnswer((_) async => loginResponse);
        final actual =
            await loginRemoteDataSource.login(loginRequest: loginRequest)
                as ApiSuccess<LoginResponse>;
        verify(mockApiService.loginUser(loginRequest)).called(1);
        expect(actual.data, loginResponse);
        expect(actual.data?.message, loginResponse.message);
      },
    );
    test(
      "should return ApiFailure with error message when login API call fails",
      () async {
        final exception = Exception('Network Error');
       when(mockApiService.loginUser(loginRequest)).thenThrow(exception);
        final actual =
            await loginRemoteDataSource.login(loginRequest: loginRequest)
                as ApiError<LoginResponse>;
        verify(mockApiService.loginUser(loginRequest)).called(1);
        expect(actual.failure, isA<ServerFailure>());
        expect(actual.failure?.errorMessage, contains('Network Error'));
      },
    );
    test(
      "should return ApiFailure when timeout occurs",
      () async {
        final exception = Exception('Request timeout');
       when(mockApiService.loginUser(loginRequest)).thenThrow(exception);
        final actual =
            await loginRemoteDataSource.login(loginRequest: loginRequest)
                as ApiError<LoginResponse>;
        verify(mockApiService.loginUser(loginRequest)).called(1);
        expect(actual.failure, isA<ServerFailure>());
        expect(actual.failure?.errorMessage, contains('Request timeout'));
      },
    );
  });
}
