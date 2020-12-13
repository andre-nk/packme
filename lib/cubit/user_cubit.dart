import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pack_me_alpha/models/apiReturnValue.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:pack_me_alpha/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if(result.value != null){
      emit(UserLoaded(user: result.value));
    }else{
      emit(UserLoadingFailed(message: result.message));
    }

  }
}
