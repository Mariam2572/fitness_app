part of 'edit_profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

// final class EditProfileInitial extends ProfileState {}
// final class EditProfileLoading extends ProfileState {}
// final class EditProfileSuccess extends ProfileState {
//   final GetUserDataReponse response;
//   const EditProfileSuccess(this.response);
//   @override
//   List<Object> get props => [response];
// }
// final class EditProfileFailure extends ProfileState {
//   final String error;
//   const EditProfileFailure(this.error);
//   @override
//   List<Object> get props => [error];
// }


final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final GetUserDataReponse response;
  const ProfileSuccess(this.response);
  @override
  List<Object> get props => [response];
}
final class ProfileFailure extends ProfileState {
  final String error;
  const ProfileFailure(this.error);
  @override
  List<Object> get props => [error];
}

final class UploadPhotoInitial extends ProfileState {}
final class UploadPhotoLoading extends ProfileState {}
final class UploadPhotoSuccess extends ProfileState {
  final UploadPhotoResponse response;
  const UploadPhotoSuccess(this.response);
  @override
  List<Object> get props => [response];
}
final class UploadPhotoFailure extends ProfileState {
  final String error;
  const UploadPhotoFailure(this.error);
  @override
  List<Object> get props => [error];
}


