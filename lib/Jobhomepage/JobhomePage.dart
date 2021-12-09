import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/drawer/Navigationdrawer.dart';

class jobhomePage extends StatefulWidget {
  const jobhomePage({Key? key}) : super(key: key);

  @override
  _jobhomePageState createState() => _jobhomePageState();
}

class _jobhomePageState extends State<jobhomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'Assest/images/logo.png',
        ),
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
        backgroundColor: Color(0xff5ECC1A),
        title: Text(
          "Getjob",
          style: GoogleFonts.roboto(fontSize: 25),
        ),

      ),
      endDrawer: navigationDrawer(),
      body: Container(
      ),
    );
  }
}

