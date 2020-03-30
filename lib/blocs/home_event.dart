import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchHomeData extends HomeEvent {
  const FetchHomeData();

  @override
  List<Object> get props => [];
}
