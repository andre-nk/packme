part of '../pages.dart';

class UserListener extends StatelessWidget {

  final UserDataRepository user = UserDataRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(user),
      child: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserState states = context.watch<UserCubit>().state;

    if(states is UserInitial){
      context.watch<UserCubit>().isUserDataExisted();
    }

    if(states is UserNonExistent){
      context.watch<UserCubit>().createUserData();
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state){
        return (state is UserLoading)
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : state is UserExist
            ? Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<AuthenticationCubit>().signOut();
                    },
                    child: Text("BlocProvider")
                  ),
                )
              )
            : ErrorStatePage();
      },
    );
  }
}
