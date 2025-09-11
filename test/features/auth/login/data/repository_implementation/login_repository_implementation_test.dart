
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/data/repository_implementation/login_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_implementation_test.mocks.dart';

@GenerateMocks([LoginRemoteDataSource])
void main() {
  late LoginRepositoryImplementation loginRepo;
  late LoginRemoteDataSource loginRemoteDataSource;

  final loginRequest = LoginRequest(
    email: "sam@gmail.com",
    password: "Sam@1234",
  );
  group('Test LoginRepositoryImplementation', () {
    setUpAll(() {
      loginRemoteDataSource = MockLoginRemoteDataSource();
      loginRepo = LoginRepositoryImplementation(
        loginRemoteDataSource: loginRemoteDataSource,
      );
    });
    test(
      "when call login method from login repo imple should return ApiSuccess<LoginResponse>",
      () async {
        final result = ApiSuccess<LoginResponse>();
        provideDummy<ApiResult<LoginResponse>>(result);
        when(
          loginRemoteDataSource.login(loginRequest: loginRequest),
        ).thenAnswer((_) async => result);

        final actual = await loginRepo.login(loginRequest: loginRequest);
        verify(
          loginRemoteDataSource.login(loginRequest: loginRequest),
        ).called(1);
        expect(actual, result);
      },
    );
    test(
      "when call login method from login repo imple should return ApiError<LoginResponse>",
      () async {
        final expectedResult = ApiError<LoginResponse>();
        provideDummy<ApiResult<LoginResponse>>(expectedResult);
        when(
          loginRemoteDataSource.login(loginRequest: loginRequest),
        ).thenAnswer((_) async => expectedResult);
        final actual = await loginRepo.login(loginRequest: loginRequest);
        // expect(actual, expectedResult);
        expect(actual, isA<ApiError<LoginResponse>>());
        verify(
          loginRemoteDataSource.login(loginRequest: loginRequest),
        ).called(1);
      },
    );
  });
}
