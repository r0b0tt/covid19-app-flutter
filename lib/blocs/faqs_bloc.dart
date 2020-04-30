import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/faqs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqsBloc extends Bloc<DataEvent, DataState> {
  final FaqsRepository faqsRepository;

  FaqsBloc({@required this.faqsRepository}) : assert(faqsRepository != null);

  @override
  DataState get initialState => DataEmpty();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchFaqsData) {
      yield DataLoading();
      try {
        final FaqsModel faqsModel = await faqsRepository.fetchFaqs();
        yield FaqsLoaded(faqsModel: faqsModel);
      } catch (err) {
        print(err);
        yield DataError();
      }
    }
  }
}
