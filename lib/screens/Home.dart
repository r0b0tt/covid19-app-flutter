import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/home_bloc.dart';
import 'package:covid19/blocs/home_event.dart';
import 'package:covid19/blocs/home_state.dart';
import 'package:covid19/components/loading_widget.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final HomeRepository homeRepository =
      HomeRepository(dataApiClient: DataApiClient(httpClient: Client()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository: homeRepository),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const cardTitleStyles = TextStyle(color: AppColors.BLUE, fontSize: 14);
  static const patientsNumberStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeEmpty) {
        BlocProvider.of<HomeBloc>(context).add(FetchHomeData());
      }
      if (state is HomeError) {
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
                    BlocProvider.of<HomeBloc>(context).add(FetchHomeData());
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
      if (state is HomeLoaded) {
        return Container(
          color: AppColors.GREY,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Card(
                color: Colors.lightBlueAccent,
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/images/relaxing.svg",
                              height: 120,
                              width: 120,
                            ),
                            RichText(
                              text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "STAY HOME!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .apply(
                                            color: Colors.black,
                                          ),
                                    ),
                                    TextSpan(
                                      text: "\nStay Safe",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .apply(
                                            color: Colors.white,
                                          ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: () {
                            _launchUrl(
                                "https://www.who.int/emergencies/diseases/novel-coronavirus-2019");
                          },
                          color: Colors.white,
                          child: Text("Learn More"),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 12),
              // World Cases
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "World Cases",
                        style: cardTitleStyles,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Infected",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.confirmed.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(""),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Recovered",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.recovered.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  state.homeModel.recoveredPercentage,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Deaths",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.deaths.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  state.homeModel.deathPercentage,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Prevention
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Prevention",
                        style: cardTitleStyles,
                      ),
                      SizedBox(height: 24),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/stay-home.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'STAY',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' home'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/distance.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'KEEP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' a safe distance'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/hand-wash.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'WASH',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' hands often'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/cough.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'COVER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' your cough'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/call-center.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'SICK?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' call ahead'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/government.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'FOLLOW',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' instructions'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return LoadingWidget();
    });
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
