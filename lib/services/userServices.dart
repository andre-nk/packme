part of 'services.dart';

class UserServices{
  static Future<ApiReturnValue<User>> signIn(String email, String password) async{
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: sampleUser);
    // return ApiReturnValue(message: "E-mail atau password salah");
  }
}