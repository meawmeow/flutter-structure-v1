import 'package:flutter/material.dart';

import '../styles/box_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final Function? onLeading;
  final List<Widget>? iconActions;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.leadingIcon,
      this.onLeading,
      this.iconActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
        child: Row(
          children: [Text(title)],
        ),
      ),
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon),
              onPressed: () {
                if (onLeading != null) onLeading!();
              },
            )
          : null,
      actions: iconActions != null ? iconActions : null,
      flexibleSpace: Container(
        decoration: BoxStyle.boxDecorationHeader,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);

  static iconAct(IconData iconData, Function? onPress) {
    return InkWell(
      onTap: () => onPress!(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(iconData),
      ),
    );
  }
}
