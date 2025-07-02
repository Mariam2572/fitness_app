part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileSuccess extends EditProfileState {
  final GetUserDataReponse response;
  const EditProfileSuccess(this.response);
  @override
  List<Object> get props => [response];
}
final class EditProfileFailure extends EditProfileState {
  final String error;
  const EditProfileFailure(this.error);
  @override
  List<Object> get props => [error];
}


final class GetProfileInitial extends EditProfileState {}
final class GetProfileLoading extends EditProfileState {}
final class GetProfileSuccess extends EditProfileState {
  final GetUserDataReponse response;
  const GetProfileSuccess(this.response);
  @override
  List<Object> get props => [response];
}
final class GetProfileFailure extends EditProfileState {
  final String error;
  const GetProfileFailure(this.error);
  @override
  List<Object> get props => [error];
}

final class UploadPhotoInitial extends EditProfileState {}
final class UploadPhotoLoading extends EditProfileState {}
final class UploadPhotoSuccess extends EditProfileState {
  final UploadPhotoResponse response;
  const UploadPhotoSuccess(this.response);
  @override
  List<Object> get props => [response];
}
final class UploadPhotoFailure extends EditProfileState {
  final String error;
  const UploadPhotoFailure(this.error);
  @override
  List<Object> get props => [error];
}


