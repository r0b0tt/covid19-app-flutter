import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/blocs/faqs_bloc.dart';
import 'package:covid19/components/loading_widget.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/faqs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Faqs extends StatelessWidget {
  final FaqsRepository faqsRepository =
      FaqsRepository(dataApiClient: DataApiClient(httpClient: Client()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FaqsBloc(
              faqsRepository: faqsRepository,
            ),
        child: BlocBuilder<FaqsBloc, DataState>(
          builder: (context, state) {
            if (state is DataEmpty) {
              BlocProvider.of<FaqsBloc>(context).add(FetchFaqsData());
            }
            if (state is DataError) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 36,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "An error occurred",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      RaisedButton(
                        onPressed: () {
                          BlocProvider.of<FaqsBloc>(context)
                              .add(FetchFaqsData());
                        },
                        child: Text(
                          "Try Again",
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            if (state is FaqsLoaded) {
              List<Widget> faqs = [];

              for (var faq in state.faqsModel.faqs) {
                String question = faq["question"];
                String answer = faq["answer"];
                faqs.add(
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            question,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .apply(fontWeightDelta: 2),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Linkify(
                            onOpen: (link) => _launchUrl(link.url),
                            text: answer,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: faqs,
                      ),
                    ),
                  ],
                ),
              );
            }
            return LoadingWidget(
              text: "Loading FAQs",
            );
          },
        ));
  }
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}
