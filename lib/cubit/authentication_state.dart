part of 'authentication_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class PasswordResetSent extends AuthState{}

class OnboardingCompleted extends AuthState{}

class OnboardingIsNotCompleted extends AuthState{}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class NotAuthenticated extends AuthState{}

class AuthFailedState extends AuthState {
  final String errorMessage;
  AuthFailedState(this.errorMessage);
  
  @override
  List<Object> get props => [];
}