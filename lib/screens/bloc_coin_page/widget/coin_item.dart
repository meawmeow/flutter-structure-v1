import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/data/models/coin_modal.dart';
import 'package:intl/intl.dart';

import '../../../components/dialogs/dialog_cus_info.dart';
import '../../../components/dialogs/dislog_confirm.dart';
import '../../../router/router_name.dart';

class CoinItem extends StatelessWidget {
  final Data data;
  const CoinItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemCoin(data, context);
  }

  Widget boxContent(context) {
    var f = NumberFormat('###,###,###,###.0#', 'en_US');
    final price = f.format(data.quote.uSD.price);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(data.cmcRank.toString()),
              SizedBox(
                width: 10,
              ),
              Text(data.name),
            ],
          ),
          Text(price.toString())
        ],
      ),
    );
  }

  Widget backgroundLeft() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      color: Colors.blue,
      child: Icon(
        Icons.open_in_new,
        color: Colors.white,
      ),
    );
  }

  Widget secondaryBackgroundRight() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  //main rander
  Widget itemCoin(Data data, context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, RouterName.COIN_DETAIL, arguments: data),
      child: Dismissible(
        key: Key("${data.id}"),
        background: backgroundLeft(),
        secondaryBackground: secondaryBackgroundRight(),
        child: boxContent(context),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            print("left");
          } else {
            print('right');
          }
        },
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            print("Open page");
            return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogCusInfo(title: data.name);
                });
          } else {
            print('Delete item');
            return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogConfirm(
                    title: data.name,
                  );
                });
          }
          return false;
        },
      ),
    );
  }
}
