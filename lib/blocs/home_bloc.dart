import 'package:covid19/blocs/home_event.dart';
import 'package:covid19/blocs/home_state.dart';
import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository}) : assert(homeRepository != null);

  @override
  HomeState get initialState => HomeEmpty();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeData) {
      yield HomeLoading();
      try {
        final HomeModel homeModel = await homeRepository.fetchHomeData();
        yield HomeLoaded(homeModel: homeModel);
      } catch (err) {
        print(err);
        yield HomeError();
      }
    }
  }
}
