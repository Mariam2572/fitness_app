import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhoto {
  final ProfileRepository repository;
  UploadPhoto(this.repository);
}
