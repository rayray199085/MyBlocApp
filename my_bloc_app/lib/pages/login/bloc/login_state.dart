part of 'login_cubit.dart';

enum LoginStatus {
  inProgress,
  submitting,
  complete,
}

class LoginState extends Equatable {
  const LoginState({
    this.obscurePw = true,
    this.username = '',
    this.password = '',
    this.status = LoginStatus.inProgress,
  });
  final bool obscurePw;
  final String username;
  final String password;
  final LoginStatus status;

  LoginState copyWith({
    bool? obscurePw,
    String? username,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      obscurePw: obscurePw ?? this.obscurePw,
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        obscurePw,
        username,
        password,
        status,
      ];
}
