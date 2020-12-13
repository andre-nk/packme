part of 'packdetail_cubit.dart';

abstract class PackDetailState extends Equatable {
  const PackDetailState();

  @override
  List<Object> get props => [];
}

class PackDetailInitial extends PackDetailState {}

class PackDetailLoaded extends PackDetailState{
  final List<PackDetail> pack;

  PackDetailLoaded({this.pack});

  @override
  List<Object> get props => [pack];
}

class PackLoadingFailed extends PackDetailState{
  final String message;

  PackLoadingFailed({this.message});

  @override
  List<Object> get props => [message];

}