import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String text;

  LoadingWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
            SizedBox(height: 8),
            Text(
              text != null ? text : "Loading...",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
