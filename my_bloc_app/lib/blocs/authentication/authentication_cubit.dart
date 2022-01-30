import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState());

  void updateAuthStatus({
    required AuthStatus status,
    String username = '',
    String token = '',
  }) {
    emit(state.copyWith(
      status: status,
      username: username,
      token: token,
    ));
  }
}
