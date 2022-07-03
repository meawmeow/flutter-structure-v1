import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/data/models/coin_modal.dart';
import 'package:intl/intl.dart';

class CoinDetail extends StatelessWidget {
  final Data data;
  const CoinDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final coin = ModalRoute.of(context)!.settings.arguments;

    var f = NumberFormat('###,###,###,###.0#', 'en_US');
    final price = f.format(data.quote.uSD.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("Coin detail"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(data.name),
                Text(price.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
