import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuItemButtun {
  final String text;
  final IconData icon;

  const MenuItemButtun({
    required this.text,
    required this.icon,
  });
}

class MenuItemsButton {
  static const List<MenuItemButtun> firstItems = [share];
  static const List<MenuItemButtun> secondItems = [logout];

  // static const home = MenuItemButtun(text: 'Home', icon: Icons.home);
  static const share = MenuItemButtun(text: 'Share', icon: Icons.share);
  // static const settings =
  //     MenuItemButtun(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItemButtun(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItemButtun item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 14),
        const SizedBox(width: 10),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItemButtun item) {
    switch (item) {
      case MenuItemsButton.share:
        //Do something
        break;
      case MenuItemsButton.logout:
        return FirebaseAuth.instance.signOut();
    }
  }
}
