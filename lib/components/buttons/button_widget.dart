import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPress;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;
  final String text;
  final Icon icon;
  final double width;
  final double height;

  const ButtonWidget(
      {Key? key,
      required this.onPress,
      required this.textColor,
      required this.bgColor,
      required this.borderColor,
      required this.text,
      required this.icon,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPress(),
      textColor: textColor,
      color: bgColor,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
      height: 45,
      minWidth: 600,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3))),
    );
  }
}
