// presentation/view_model/change_password_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/domain/usecase/change_passwrod_usecase.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_states.dart';

sealed class ChangePasswordIntent {}

class SubmitChangePasswordIntent extends ChangePasswordIntent {
  final ChangePasswordRequest request;

  SubmitChangePasswordIntent(this.request);
}

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit(this.changePasswordUseCase)
    : super(ChangePasswordInitial());

  void doIntent(ChangePasswordIntent intent) {
    if (intent is SubmitChangePasswordIntent) {
      _handleChangePassword(intent.request);
    }
  }

  Future<void> _handleChangePassword(ChangePasswordRequest request) async {
    emit(ChangePasswordLoading());

    final result = await changePasswordUseCase.invoke(request);

    switch (result) {
      case ApiSuccess<ChangePasswordResponse>():
        emit(ChangePasswordSuccess(result.data!));
        break;
      case ApiError<ChangePasswordResponse>():
        emit(ChangePasswordFailure(result.message ?? 'Unknown error occurred'));
        break;
    }
  }
}
