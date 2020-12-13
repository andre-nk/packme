part of 'services.dart';

class PackServices{
  static Future<ApiReturnValue<List<PackDetail>>> getPackDetail() async{
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: packDetails);
  }
}