import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/components/styles/box_style.dart';

class HelperHeader {
  static iconAct(IconData iconData) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(iconData),
      ),
    );
  }

  static PreferredSizeWidget header(
      {required String title, IconData? leading, Function? onLeading}) {
    return AppBar(
      title: Container(
        child: Row(
          children: [Text(title)],
        ),
      ),
      leading: IconButton(
        icon: Icon(leading),
        onPressed: () => onLeading!(),
      ),
      actions: [
        iconAct(Icons.info),
      ],
      flexibleSpace: Container(
        decoration: BoxStyle.boxDecorationHeader,
      ),
    );
  }
}
