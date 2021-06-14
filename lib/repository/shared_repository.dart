part of 'repositories.dart';

abstract class SharedRepository{
  Future<bool> isOnboardingCompleted();
  Future<void> completeOnboarding();
  Future<void> setUserID(String value);
}

class SharedPreferencesRepository implements SharedRepository{
  @override
  Future<void> completeOnboarding() async {
    final _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setBool("isOnboardingCompleted", true);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    final _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref.getBool("isOnboardingCompleted") ?? false;
  }

  @override
  Future<void> setUserID(String value) async {
    final _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setString("userID", value);
  }

  Future<void> clearUserID(String value) async {
    final _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.remove("userID");
  }
}