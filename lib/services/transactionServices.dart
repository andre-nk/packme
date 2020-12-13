part of 'services.dart';

class TransactionServices{
  static Future<ApiReturnValue<List<Transaction>>> getTransaction() async{
    await Future.delayed(Duration(milliseconds: 3000));

    return ApiReturnValue(value: mockTransaction);
  }

  static  Future<ApiReturnValue<Transaction>> createTransaction(Transaction transaction) async{
    await Future.delayed(Duration(milliseconds: 2000));

    return ApiReturnValue(value: transaction.copyWith(
      id: 1,
      status: TransactionStatus.in_progress
    ));
  }
}