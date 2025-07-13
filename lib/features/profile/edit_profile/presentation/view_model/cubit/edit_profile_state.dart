part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileSuccess extends EditProfileState {
  final  response;
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




