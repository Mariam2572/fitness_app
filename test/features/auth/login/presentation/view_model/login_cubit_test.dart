
import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/user_data.dart';
import 'package:fitness_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginUsecase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("test login cubit", () {
    late LoginCubit loginCubit;
    late LoginUsecase mockLoginUsecase;

    final loginRequest = LoginRequest(
      email: "sam@gmail.com",
      password: "Sam@1234",
    );
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
    setUpAll(() {
      mockLoginUsecase = MockLoginUsecase();
      final expecteResponse = ApiSuccess<LoginResponse>(data: loginResponse);
      provideDummy<ApiResult<LoginResponse>>(expecteResponse);
      when(
        mockLoginUsecase.invoke(loginRequest: loginRequest),
      ).thenAnswer((_) async => expecteResponse);
      
      
    });
    setUp(() {
      loginCubit = LoginCubit(mockLoginUsecase);
    });

    blocTest<LoginCubit, LoginState>(
      "when call doIntent with PerformLogin it should call _handleLogin when login is success it shall emit loading state and after that success state ",
      build: () => loginCubit,

      act:
          (loginCubit) =>
              loginCubit.doIntent(PerformLogin(request: loginRequest)),
      expect: () {
        return [LoginLoading(), LoginSuccess(loginResponse)];
      },
      verify: (bloc) {
        verify(mockLoginUsecase.invoke(loginRequest: loginRequest)).called(1);
      },
    );
    blocTest<LoginCubit, LoginState>(
      "when call doIntent with PerformLogin it should call _handleLogin when login is failed it shall emit loading state and after that error state",
     setUp: (){
       final expectedFailerResult = ApiError<LoginResponse>(failure: ServerFailure(errorMessage: "Login Failed"));
      provideDummy<ApiResult<LoginResponse>>(expectedFailerResult);
      when(
        mockLoginUsecase.invoke(loginRequest: loginRequest),
      ).thenAnswer((_) async => expectedFailerResult);
     },
      build: () => loginCubit,
      act: (bloc) => loginCubit.doIntent(PerformLogin(request: loginRequest)),
      verify: (bloc) {
        verify(mockLoginUsecase.invoke(loginRequest: loginRequest)).called(1);
      },
      expect: () => [LoginLoading(),LoginFailure("Login Failed")],
    );
  });
}
