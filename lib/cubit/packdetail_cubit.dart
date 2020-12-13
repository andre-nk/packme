import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pack_me_alpha/models/apiReturnValue.dart';
import 'package:pack_me_alpha/models/packDetail.dart';
import 'package:pack_me_alpha/services/services.dart';

part 'packdetail_state.dart';

class PackDetailCubit extends Cubit<PackDetailState> {
  PackDetailCubit() : super(PackDetailInitial());

  Future<void> getPackDetail() async {
    ApiReturnValue<List<PackDetail>> result = await PackServices.getPackDetail();

    if(result.value != null){
      emit(PackDetailLoaded(pack: result.value));
    }else{
      emit(PackLoadingFailed(message: result.message));
    }

  }
}
