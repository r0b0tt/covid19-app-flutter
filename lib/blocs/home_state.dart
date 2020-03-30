import 'package:covid19/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeEmpty extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel homeModel;

  const HomeLoaded({@required this.homeModel}) : assert(homeModel != null);

  @override
  List<Object> get props => [homeModel];
}

class HomeError extends HomeState {}
