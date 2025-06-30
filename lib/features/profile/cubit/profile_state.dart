part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
// ignore: must_be_immutable
final class ProfileLoaded extends ProfileState {
  String message;
  ProfileLoaded({required this.message});
}
final class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});
}