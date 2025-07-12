

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_usecase_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main(){
  late MockHomeRepo mockHomeRepo;
  late HomeUseCase homeUseCase;

  provideDummy<ApiResult<String>>(ApiError(message: 'Dummy error'));



  setUp(()
  {
  mockHomeRepo = MockHomeRepo();
  homeUseCase = HomeUseCase(mockHomeRepo);
  },);
  
  group('HomeUseCase Test', () {
    test('get userName function returns apiSuccess with the userName',
          () async{

             //Arrange
            const userName = "James";
            final expected = ApiSuccess<String>(data: userName);
            when(mockHomeRepo.
            getCurrentUserName())
                .thenAnswer((_) async=> expected
            );
            //Act
            final result = await homeUseCase.getUserName();


            //Assert
            expect(result,isA<ApiSuccess<String>>());
            expect((result as ApiSuccess<String>).data,userName);
            verify(mockHomeRepo.getCurrentUserName()).called(1);


          },);
    test('getUserName returns ApiError on failure', () async {
      // Arrange
      final expected = ApiError<String>(message: 'Error occurred');
      when(mockHomeRepo.getCurrentUserName()).thenAnswer((_) async => expected);

      // Act
      final result = await homeUseCase.getUserName();

      // Assert
      expect(result, isA<ApiError<String>>());
      verify(mockHomeRepo.getCurrentUserName()).called(1);
    });
  });
    
  }


