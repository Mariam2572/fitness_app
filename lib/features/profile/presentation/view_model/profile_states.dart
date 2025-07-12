// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserResponse? user;
  final String? message;
  ProfileSuccess({
     this.user,
     this.message,
  });
}

class ProfileUploading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}
