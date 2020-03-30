import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Frequently Asked Questions")),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Text("This is the question that should be answered.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 12),
                Text(
                    "This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. This ist he answer. ",
                    style: TextStyle(
                      fontSize: 16,
                    ))
              ],
            )));
  }
}
