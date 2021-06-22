part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState{
  const UserLoading();
}

class UserExist extends UserState{
  final UserModel? user;
  const UserExist(this.user);

  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;

    return o is UserExist && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class UserNonExistent extends UserState{
  const UserNonExistent();
}

class UserLoadingFailed extends UserState {
  final String errorMessage;
  UserLoadingFailed(this.errorMessage);
  
  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;

    return o is UserLoadingFailed && o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}