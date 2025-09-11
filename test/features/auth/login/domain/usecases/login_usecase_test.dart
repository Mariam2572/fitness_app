import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/domain/repos/login_repo.dart';
import 'package:fitness_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late LoginUsecase loginUsecase;
  late LoginRepo mockLoginRepo;
  final loginRequest = LoginRequest(
    email: "sam@gmail.com",
    password: "Sam@1234",
  );
  group("Test Login UseCase", () {
    setUpAll(() {
      mockLoginRepo = MockLoginRepo();
      loginUsecase = LoginUsecase(loginRepo: mockLoginRepo);
    });
    
    test("LoginUseCase should return ApiSuccess ", () async {
      //Arrange
      final result = ApiSuccess<LoginResponse>();
      provideDummy<ApiResult<LoginResponse>>(result);
      when(
        mockLoginRepo.login(loginRequest: loginRequest),
      ).thenAnswer((_) async => result);
      //Act
      final actuall = await loginUsecase.invoke(loginRequest: loginRequest);
      //Assert
      verify(mockLoginRepo.login(loginRequest: loginRequest)).called(1);
      expect(actuall, result);
    });
    test("LoginUseCase should return ApiError ", () async {
      final result = ApiError<LoginResponse>();
      provideDummy<ApiResult<LoginResponse>>(result);
      when(
        mockLoginRepo.login(loginRequest: loginRequest),
      ).thenAnswer((_) async => result);
      final actual = await loginUsecase.invoke(loginRequest: loginRequest);
      verify(mockLoginRepo.login(loginRequest: loginRequest)).called(1);
      expect(actual, result);
    });
  });
}
