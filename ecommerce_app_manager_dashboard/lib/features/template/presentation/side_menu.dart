import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        //It enable Scrolling
        child: Column(children: [
          DrawerHeader(
            child: Image.asset("assets/app_icon/delivery-man.png"),
          ),
          DrawerListTile(
            title: 'Dashbord',
            icon: Icons.supervised_user_circle_sharp,
            press: () {},
          )
        ]),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 13,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
      leading:  Icon(
        icon,
      ),
    );
  }
}
