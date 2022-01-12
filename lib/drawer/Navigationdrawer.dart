
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Employer%20job%20homePage/notifications.dart';
import 'package:hybrid/Jobhomepage/employeeProfilePage.dart';
import 'package:hybrid/forms/employeeForm.dart';
import 'package:hybrid/signin/SignIn.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,text: 'menu'),
          createDrawerBodyItem(
              icon: Icons.home,text: 'profie'),
          createDrawerBodyItem(
              icon: Icons.account_circle,text: 'update resume',onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResumeForm()));
          }),

          createDrawerBodyItem(
              icon: Icons.event_note,text: 'Events'),
          Divider(),
          createDrawerBodyItem(onTap: ((){
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Notifications()));
          }),
              icon: Icons.notifications_active,text: 'Notifications'),
          createDrawerBodyItem(
              icon: Icons.contact_phone,text: 'Contact Info'),
         createDrawerBodyItem(
          icon: Icons.add_to_home_screen,text: 'sign out', onTap: () {
           Navigator.push(context,
               MaterialPageRoute(builder: (context) => signIn()));
         })
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
          child: GradientText(
            text,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            colors: [
              Colors.red,
              Colors.pink,
              Colors.purple,
              Colors.deepPurple,
              Colors.deepPurple,
              Colors.indigo,
              Colors.blue,
              Colors.lightBlue,
              Colors.cyan,
              Colors.teal,
              Colors.green,
              Colors.lightGreen,
              Colors.lime,
              Colors.yellow,
              Colors.amber,
              Colors.orange,
              Colors.deepOrange,
            ],
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
