import 'package:equatable/equatable.dart';

class FaqsModel extends Equatable {
  final List faqs;

  const FaqsModel({this.faqs});

  @override
  List<Object> get props => [faqs];

  static FaqsModel fromJson(dynamic json) {
    return FaqsModel(faqs: json);
  }
}
