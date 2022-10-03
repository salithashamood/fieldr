import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class FieldRAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FieldRAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      title: Image.asset(appLogoSmall),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Image.asset(notificationIcon),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: notificationColor,
                  ),
                )
              ],
            )),
        IconButton(onPressed: () {}, icon: Image.asset(profileIcon)),
        IconButton(onPressed: () {}, icon: Image.asset(hamburgerIcon)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
