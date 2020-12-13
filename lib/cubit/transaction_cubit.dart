import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pack_me_alpha/models/apiReturnValue.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:pack_me_alpha/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async{
    ApiReturnValue<List<Transaction>> result = await TransactionServices.getTransaction();

    if(result.value != null){
      emit(TransactionLoaded(transaction: result.value));
    }else{
      emit(TransactionLoadingFailed(message: result.message));
    }
  }

  Future<bool> createTransaction(Transaction transaction) async{
    ApiReturnValue<Transaction> result = await TransactionServices.createTransaction(transaction);

    if(result.value != null){
      emit(TransactionLoaded(transaction: (state as TransactionLoaded).transaction + [result.value]));
      return true;
    }else{
      return false;
    }
  } 
}
