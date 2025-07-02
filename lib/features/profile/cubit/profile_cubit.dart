// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';

import 'package:fitness_app/features/logout/domain/usecases/logout_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final LogoutUseCase _logoutUseCase;
  ProfileCubit(
    this._logoutUseCase,
  ) : super(ProfileInitial());
  doIntent(ProfileIntent intent) {
    switch (intent) {
      case LogoutIntent():
        _logout();
        break;
    }
  }
  _logout() async {
      emit(ProfileLoading());
    final response = await _logoutUseCase();
    switch (response) {
      case ApiError<String>():
        emit(
          ProfileError(
          message:   response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<String>():
        emit(ProfileLoaded(message: response.data!));
      default:
      
        break;
    }

  }
}

sealed class ProfileIntent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutIntent extends ProfileIntent {}

