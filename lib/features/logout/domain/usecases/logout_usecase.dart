import 'package:fitness_app/features/logout/domain/repositories/logout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final LogoutRepository _repository;

  LogoutUseCase(this._repository);
 call() async {
   return await _repository.logout();
 }
}
