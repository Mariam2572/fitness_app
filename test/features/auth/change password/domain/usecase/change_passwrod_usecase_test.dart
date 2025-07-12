import 'package:fitness_app/features/auth/change%20password/domain/usecase/change_passwrod_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/domain/repo/change_pssword_repo.dart';

import 'change_passwrod_usecase_test.mocks.dart';

@GenerateMocks([ChangePasswordRepo])
void main() {
  late MockChangePasswordRepo mockRepo;
  late ChangePasswordUseCase useCase;

  setUp(() {
    mockRepo = MockChangePasswordRepo();
    useCase = ChangePasswordUseCase(mockRepo);
  });

  group('ChangePasswordUseCase', () {
    final request = ChangePasswordRequest(password: 'old', newPassword: 'new');
    final response = ChangePasswordResponse(
      message: 'Password updated',
      token: 'mock-token',
    );

    test('should return ApiSuccess<ChangePasswordResponse>', () async {
      final expected = ApiSuccess<ChangePasswordResponse>(data: response);
      provideDummy<ApiResult<ChangePasswordResponse>>(expected);

      when(
        mockRepo.changePassword(request: request),
      ).thenAnswer((_) async => expected);

      final actual = await useCase.invoke(request);

      verify(mockRepo.changePassword(request: request)).called(1);
      expect(actual, equals(expected));
    });

    test('should return ApiError<ChangePasswordResponse>', () async {
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
        mockRepo.changePassword(request: request),
      ).thenAnswer((_) async => expected);

      final actual = await useCase.invoke(request);

      verify(mockRepo.changePassword(request: request)).called(1);
      expect(actual, isA<ApiError<ChangePasswordResponse>>());
    });
  });
}
