import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pack_me/model/models.dart';
import 'package:pack_me/repository/repositories.dart';

part 'authentication_state.dart';

class AuthCubit extends Cubit<AuthState> with HydratedMixin {
  final AuthenticationRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());
  
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel user = await _authRepository.signIn(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  Future signUpWithGoogle() async {
    try {
      emit(AuthLoading());
      UserModel user = await _authRepository.signUpWithGoogle();
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  Future signUpWithEmailAndPassword(String email, String password, String username) async {
    try {
      emit(AuthLoading());
      UserModel user = await _authRepository.signUpWithEmail(email, password, username);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  Future signOut() async{
    try{
      emit(AuthLoading());
      await _authRepository.signOut();
      emit(NotAuthenticated()); 
    } catch (e){
      emit(AuthFailedState(e.toString()));
    }
  }

  Future completeOnboarding() async {
    try{
      emit(OnboardingCompleted());
    } catch (e){
      emit(OnboardingIsNotCompleted());
    }
  }

  Future resetPassword(String email) async {
    try {
      await _authRepository.passwordResetSubmit(email);
      emit(PasswordResetSent());
    } catch (e){
      emit(AuthFailedState(e.toString()));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      if(json["status"] == null){
        emit(NotAuthenticated());
      } else if (json["status"] == "Onboarding Completed"){
        emit(OnboardingCompleted());
      } else {
        final UserModel user = UserModel.fromJson(json);
        emit(AuthSuccess(user));
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if(state is AuthSuccess){
      return state.user.toJson(state.user);
    } else if (state is OnboardingCompleted){
      return {
        "status": "Onboarding Completed"
      };
    } else if (state is NotAuthenticated){
      return {
        "status": "Not Authenticated"
      };
    } else {
      return null;
    }
  }
}
