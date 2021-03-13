part of "configs.dart";

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
      child: (_, __) => InitialPage(),
      transition: TransitionType.fadeIn  
    ),
    ChildRoute('/signIn',
      child: (_, __) => SignInPage(),
      transition: TransitionType.fadeIn  
    ),
    ChildRoute('/homePage',
      child: (_, __) => HomePage(),
      transition: TransitionType.fadeIn   
    )
  ];
}