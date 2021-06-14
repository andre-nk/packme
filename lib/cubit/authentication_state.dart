part of 'authentication_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class OnboardingCompleted extends AuthState{
  const OnboardingCompleted();
}

class OnboardingIsNotCompleted extends AuthState{
  const OnboardingIsNotCompleted();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState{
  const AuthLoading();
}

class Authenticated extends AuthState {
  final User? user;
  const Authenticated(this.user);

  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;

    return o is Authenticated && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class NotAuthenticated extends AuthState{
  const NotAuthenticated();
}

class AuthFailedState extends AuthState {
  final String errorMessage;
  AuthFailedState(this.errorMessage);
  
  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;

    return o is AuthFailedState && o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}