import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchHomeData extends HomeEvent {
  const FetchHomeData();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
