import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pack_me/repository/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authRepository;
  AuthenticationCubit(this._authRepository) : super(AuthInitial());

  void isLoggedIn(){
    try{
      emit(AuthLoading());
      if(_authRepository.currentUser() != null){
        User? currentUser = _authRepository.currentUser();
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  void isOnboardingCompleted(){
    try{
      final SharedPreferencesRepository _prefs = SharedPreferencesRepository();
      _prefs.isOnboardingCompleted().then((value){
        if(value == true){
          emit(OnboardingCompleted());
        } else {
          emit(OnboardingIsNotCompleted());
        }
      });
    } catch (e) {
      emit(OnboardingIsNotCompleted());
    }
  }
  
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authRepository.signIn(email, password);
      User? user = _authRepository.currentUser();
      
      if(user == null){
        emit(NotAuthenticated());
      } else {
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  Future signUpWithGoogle() async {
    try {
      emit(AuthLoading());
      await _authRepository.signUpWithGoogle();
      User? user = _authRepository.currentUser();
      
      if(user == null){
        emit(NotAuthenticated());
      } else {
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  Future signUpWithEmailAndPassword(String email, String password, String username) async {
    try {
      emit(AuthLoading());
      await _authRepository.signUpWithEmail(email, password, username);
      User? user = _authRepository.currentUser();
      
      if(user == null){
        emit(NotAuthenticated());
      } else {
        emit(Authenticated(user));
      }
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
      final SharedPreferencesRepository _prefs = SharedPreferencesRepository();
      await _prefs.completeOnboarding(); 
      emit(OnboardingCompleted());
    } catch (e){
      emit(OnboardingIsNotCompleted());
    }
  }

  Future resetPassword(String email) async {
    try {
      await _authRepository.passwordResetSubmit(email);
    } catch (e){
      emit(AuthFailedState(e.toString()));
    }
  }
}
