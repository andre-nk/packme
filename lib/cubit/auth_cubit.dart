import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pack_me/models/models.dart';
import 'package:pack_me/services/services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with HydratedMixin {
  AuthCubit() : super(AuthInitial());

  void signUp({required String name, required String email, required String password}) async {
    try {
      emit(AuthLoading());

      if (name.isEmpty){
        emit(AuthFailed("Please enter you name firstly"));
      } else if(email.indexOf("@") < 0 || email.isEmpty){
        emit(AuthFailed("Please enter a proper e-mail address"));
      } else if(password.length == 0){
        emit(AuthFailed("Please enter your password before sign up"));
      } else if(password.length < 6){
        emit(AuthFailed("Your password must be more than 5 characters"));
      } else {  
        UserModel user = await AuthServices().signUp(email: email, name: name, password: password);
        emit(AuthSuccess(user));
      }

    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      if(email.indexOf("@") < 0 || email.isEmpty){
        emit(AuthFailed("Please enter a proper e-mail address"));
      } else if(password.length == 0){
        emit(AuthFailed("Please enter your password to log in"));
      } else if(password.length < 6){
        emit(AuthFailed("Your password must be more than 5 characters"));
      } else {
        UserModel user = await AuthServices().signIn(email: email, password: password);
        emit(AuthSuccess(user));
      }

    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signInWithGoogle() async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices().signUpWithGoogle();
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(NotAuthenticated());
    } catch (e){
      emit(AuthFailed(e.toString()));
    }
  }

  void signOutWithGoogle() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOutWithGoogle();
      emit(NotAuthenticated());
    } catch (e){
      emit(AuthFailed(e.toString()));
    }
  }

  void resetPassword(String email) async {
    try {
      if(email.indexOf("@") < 0 || email.isEmpty){
        emit(AuthFailed("Please enter a proper e-mail address"));
      } else {
        await AuthServices().resetPassword(email);
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void completeOnboarding() async {
    try {
      emit(OnboardingSuccess());      
    } catch (e) {
      emit(OnboardingFailed());
    }
  }

  void changeDisplayName(String name, UserModel user) async {
    try {
      emit(AuthLoading());
      UserModel _user = await AuthServices().changeDisplayName(name, user);
      emit(AuthSuccess(_user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void changeAddress(String address, UserModel user) async {
    try {
      emit(AuthLoading());
      UserModel _user = await AuthServices().changeAddress(address, user);
      emit(AuthSuccess(_user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void verifyEmail() async {
    try {
      emit(AuthLoading());
      await AuthServices().verifyEmail();
      emit(VerifyEmailSent());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      if(json["status"] == "Not Authenticated"){
        return NotAuthenticated();
      } else if (json["status"] == "Onboarding Completed") {
        return OnboardingSuccess();
      } else {
        final userModel = UserModel.fromJson(json);
        return AuthSuccess(userModel);
      }
    } catch (e) {
      return AuthFailed(e.toString());
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if(state is AuthSuccess){
      return state.user.toJson(state.user);
    } else if (state is NotAuthenticated) {
      return {
        "status": "Not Authenticated"
      };
    } else if (state is OnboardingSuccess) {
      return{
        "status": "Onboarding Completed"
      };
    } else {
      return {
        "status": null
      };
    }
  }
}
