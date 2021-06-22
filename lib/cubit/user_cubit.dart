import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pack_me/model/models.dart';
import 'package:pack_me/repository/repositories.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserDataRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  void isUserDataExisted(){
    try{
      emit(UserLoading());
      _userRepository.getUserData().then((value){
        // ignore: unnecessary_null_comparison
        if(value != null){
          UserModel currentUser = value;
          emit(UserExist(currentUser));
        // ignore: unnecessary_null_comparison
        } else if (value == null){
          emit(UserNonExistent());
        }
      });
    } catch (e) {
      emit(UserLoadingFailed(e.toString()));
    }
  }

  Future<UserModel> getUserData() async {
    UserModel user = await _userRepository.getUserData();
    return user;
  }

  void createUserData(){
    try{
      emit(UserLoading());
      _userRepository.createUserData();
      _userRepository.getUserData().then((value){
        // ignore: unnecessary_null_comparison
        if(value != null){
          UserModel currentUser = value;
          emit(UserExist(currentUser));
        // ignore: unnecessary_null_comparison
        } else if (value == null){
          emit(UserNonExistent());
        }
      });
    } catch (e){
      emit(UserLoadingFailed(e.toString()));
    }
  }
}
