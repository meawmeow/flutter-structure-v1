import 'package:flutter/material.dart';

class CoinCirProgress extends StatelessWidget {
  Color? color = Colors.green;
  CoinCirProgress({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
