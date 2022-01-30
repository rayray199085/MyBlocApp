part of 'authentication_cubit.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthStatus.authenticated,
    this.username = '',
    this.token = '',
  });
  final AuthStatus status;
  final String username;
  final String token;

  AuthenticationState copyWith({
    required AuthStatus status,
    required String username,
    required String token,
  }) {
    return AuthenticationState(
      status: status,
      username: username,
      token: token,
    );
  }

  @override
  List<Object> get props => [];
}
