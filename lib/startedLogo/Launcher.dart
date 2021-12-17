import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/signin/SignIn.dart';
import './MakeChoice.dart';
import 'package:google_fonts/google_fonts.dart';

class launcher extends StatefulWidget {
  @override
  _launcherState createState() => _launcherState();
}

class _launcherState extends State<launcher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => signIn(key:UniqueKey()))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 150, 10, 10),
      height: 400,
      width: 400,
      child: Column(
        children: [
          Image.asset("Assest/images/logo.png", width: 200, height: 300),
          Text(
            "GetJob",
            style: GoogleFonts.roboto(
                textStyle:
                    TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
