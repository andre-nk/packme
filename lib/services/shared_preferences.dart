part of "services.dart";

class SharedPref extends ChangeNotifier{
  final SharedPreferences sharedPref;

  SharedPref(this.sharedPref);

  bool get isFirstTime => sharedPref?.getBool("isFirstTime") ?? true;

  void setIsFirstTime(bool value){
    sharedPref.setBool("isFirstTime", value);
    notifyListeners();
  }
}