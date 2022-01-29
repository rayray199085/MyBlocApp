import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void togglePwText() {
    emit(state.copyWith(obscurePw: !state.obscurePw));
  }

  void updatePassword(String text) {
    emit(state.copyWith(password: text));
  }

  void updateUsername(String text) {
    emit(state.copyWith(username: text));
  }

  Future<void> submitForm() async {
    emit(state.copyWith(status: LoginStatus.submitting));
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      emit(state.copyWith(
        status: LoginStatus.complete,
      ));
    });
  }
}
