import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fetchFaqs();
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Title",
                          style: Theme.of(context).textTheme.body2,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("This is the content")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void fetchFaqs() async {}
