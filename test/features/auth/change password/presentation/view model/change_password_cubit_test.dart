import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/domain/usecase/change_passwrod_usecase.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_cubit.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_states.dart';

import 'change_password_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  late ChangePasswordCubit cubit;
  late MockChangePasswordUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockChangePasswordUseCase();
    cubit = ChangePasswordCubit(mockUseCase);
  });

  final request = ChangePasswordRequest(
    password: 'oldPass',
    newPassword: 'newPass',
  );
  final response = ChangePasswordResponse(
    message: 'Password changed',
    token: 'newToken',
  );

  group('ChangePasswordCubit', () {
    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [Loading, Success] when password change is successful',
      build: () {
        final success = ApiSuccess<ChangePasswordResponse>(data: response);
        provideDummy<ApiResult<ChangePasswordResponse>>(success);
        when(mockUseCase.invoke(request)).thenAnswer((_) async => success);
        return cubit;
      },
      act: (cubit) => cubit.doIntent(SubmitChangePasswordIntent(request)),
      expect: () => [ChangePasswordLoading(), ChangePasswordSuccess(response)],
      verify: (_) {
        verify(mockUseCase.invoke(request)).called(1);
      },
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [Loading, Failure] when password change fails',
      build: () {
        final error = ApiError<ChangePasswordResponse>(
          message: 'Invalid token',
          failure: ServerFailure(errorMessage: 'Invalid token'),
        );
        provideDummy<ApiResult<ChangePasswordResponse>>(error);
        when(mockUseCase.invoke(request)).thenAnswer((_) async => error);
        return cubit;
      },
      act: (cubit) => cubit.doIntent(SubmitChangePasswordIntent(request)),
      expect:
          () => [
            ChangePasswordLoading(),
            const ChangePasswordFailure('Invalid token'),
          ],
      verify: (_) {
        verify(mockUseCase.invoke(request)).called(1);
      },
    );
  });
}
