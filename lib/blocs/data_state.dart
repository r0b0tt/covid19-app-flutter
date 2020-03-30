import 'package:covid19/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataEmpty extends DataState {}

class DataLoading extends DataState {}

class CountriesLoaded extends DataState {
  final CountriesModel countriesModel;

  const CountriesLoaded({@required this.countriesModel});

  @override
  List<Object> get props => [countriesModel];
}

class DataError extends DataState {}
