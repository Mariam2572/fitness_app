import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/data/repos/register_repo_impl.dart';
import 'package:fitness_app/features/auth/register/domain/repos/data_source/register_data_source.dart';
import 'package:fitness_app/features/auth/register/domain/repos/register_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'register_repo_impl_test.mocks.dart';

@GenerateMocks([RegisterDataSource])
void main() {
  late MockRegisterDataSource mockRepo;
  late RegisterRepo repo;
  final request = RegisterRequest(
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

  final expected = RegisterResponse(
    user: User(),
    message: 'Registration successful',
    token: 'token123',
  );
  setUp(() {
    mockRepo =MockRegisterDataSource();
    repo = RegisterRepoImpl(mockRepo);
  });
  group('test forget password repo impl', () {
    test(
      'when call forget password repo should call forget password data source and it should return Apisuccess<ForgetPasswordResponse>',
      () async {
        //arrange
        
        final result = ApiSuccess<RegisterResponse>(
          data: expected,
        );
        provideDummy<ApiResult<RegisterResponse>>(result);
        when(
          mockRepo.register(request),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.register(request);
        //assert
        verify(mockRepo.register(request)).called(1);
        expect(actual, result);
      },
    );
    test('should return ApiError when data source fails', () async {
    
      final expected = ApiError<RegisterResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );

      when(mockRepo.register(request)).thenAnswer((_) async => expected);

      final actual = await repo.register(request);

      verify(mockRepo.register(request)).called(1);
      expect(actual, equals(expected));
    });
  });

  }
