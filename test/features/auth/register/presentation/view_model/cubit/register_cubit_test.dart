import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_cubit_test.mocks.dart';
// ignore: non_constant_identifier_names

@GenerateMocks([RegisterUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('test Register cubit', () {
    late RegisterCubit registerCubit;
    late RegisterUseCase registerUseCase;

    final registerRequest = RegisterRequest(
      firstName: 'John',
      lastName: 'Doe',
      email: 'r5P7o@example.com',
      password: 'password',
      rePassword: 'password',
      gender: Gender.male.name,
      height: 175,
      weight: 70,
      age: 30,
      goal: 'Lose weight',
      activityLevel: 'Moderate',
    );

    final registerResponse = RegisterResponse(
      user: User(),
      message: 'Registration successful',
      token: 'token123',
    );

    setUp(() {
      registerUseCase = MockRegisterUseCase();
      registerCubit = RegisterCubit(registerUseCase);
    });

    blocTest<RegisterCubit, RegisterState>(
      'When call doIntent with RegisterUserIntent, it should call registerUseCase and return ApiSuccess and emits RegisterLoading and then RegisterSuccess',
      build: () {
        final expectedResponse = ApiSuccess<RegisterResponse>(
          data: registerResponse,
        );
        provideDummy<ApiResult<RegisterResponse>>(expectedResponse);
        when(
          registerUseCase.invoke(registerRequest),
        ).thenAnswer((_) async => expectedResponse);
        return registerCubit;
      },
      act:
          (bloc) => bloc.doIntent(RegisterUserIntent(request: registerRequest)),
      expect: () => [RegisterLoading(), RegisterSuccess(registerResponse)],
      verify: (bloc) {
        verify(registerUseCase.invoke(registerRequest)).called(1);
      },
    );
    blocTest<RegisterCubit, RegisterState>(
      'When call doIntent with RegisterUserIntent, it should call registerUseCase and return ApiError and emits RegisterLoading and then RegisterFailure',
      build: () {
        final expectedResponse = ApiError<RegisterResponse>(
          failure: ServerFailure(errorMessage: 'Registration failed'),
        );
        provideDummy<ApiResult<RegisterResponse>>(expectedResponse);
        when(
          registerUseCase.invoke(registerRequest),
        ).thenAnswer((_) async => expectedResponse);
        return registerCubit;
      },
      act:
          (bloc) => bloc.doIntent(RegisterUserIntent(request: registerRequest)),
      expect: () => [RegisterLoading(), RegisterFailure('Registration failed')],
      verify: (bloc) {
        verify(registerUseCase.invoke(registerRequest)).called(1);
      },
    );
  });
}
