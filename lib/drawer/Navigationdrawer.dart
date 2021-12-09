
import 'package:flutter/material.dart';
class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
         // createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,text: 'Home'),
          createDrawerBodyItem(
              icon: Icons.account_circle,text: 'Profile'),
          createDrawerBodyItem(
              icon: Icons.event_note,text: 'Events'),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active,text: 'Notifications'),
          createDrawerBodyItem(
              icon: Icons.contact_phone,text: 'Contact Info'),
          ListTile(
            title: Text('click me'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
Widget createDrawerBodyItem(
    {required IconData icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
