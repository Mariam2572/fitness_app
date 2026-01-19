import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/logout/data/datasources/logout_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../auth/register/data/data_source/register_data_source_impl_test.mocks.dart';

void main() {
  late MockApiService mockApiService;
  late LogoutRemoteDataSourceImpl logoutRemoteDataSourceImpl;

  setUp(() {
    mockApiService = MockApiService();
    logoutRemoteDataSourceImpl = LogoutRemoteDataSourceImpl(
      apiService: mockApiService,
    );
  });

  group('LogoutRemoteDataSourceImpl', () {
    test('should return success ApiResult when logout succeeds', () async {
      when(
        mockApiService.logout(),
      ).thenAnswer((_) async => Future(() => 'success'));
      final result = await logoutRemoteDataSourceImpl.logout();
      expect(result, isA<ApiSuccess<String>>());
      verify(mockApiService.logout()).called(1);
    });

    test(
      'should return failure ApiResult when logout throws exception',
      () async {
        when(mockApiService.logout()).thenThrow(Exception('Logout failed'));

        final result = await logoutRemoteDataSourceImpl.logout();

        expect(result, isA<ApiError<String>>());
        verify(mockApiService.logout()).called(1);
      },
    );
  });
}
