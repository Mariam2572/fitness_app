import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/register/data/data_source/register_data_source_impl.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late RegisterDataSourceImpl registerDataSource;
  setUp(() {
    mockApiService = MockApiService();
    registerDataSource = RegisterDataSourceImpl(mockApiService);
  });
  group('RegisterDataSourceImpl', () {
    final request = RegisterRequest(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      rePassword: 'password123',
    );
    final response = RegisterResponse(message: 'success');
    test(
      'when call register should return success ApiResult when register succeeds',
      () async {
        when(
          mockApiService.register(request),
        ).thenAnswer((_) async => response);
        final result = await registerDataSource.register(request);
        expect(result, isA<ApiSuccess<RegisterResponse>>());
        expect((result as ApiSuccess).data.message, equals('success'));
        verify(mockApiService.register(request)).called(1);
      },
    );
    test(
      'should return failure ApiResult when register throws exception',
      () async {
        when(
          mockApiService.register(request),
        ).thenThrow(Exception('Registration failed'));
        final result = await registerDataSource.register(request);
        expect(result, isA<ApiError<RegisterResponse>>());
        verify(mockApiService.register(request)).called(1);
      },
    );
  });
}
