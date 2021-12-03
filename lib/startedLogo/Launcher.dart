import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Optionpage.dart';

class launcher extends StatefulWidget {
  const launcher({Key? key}) : super(key: key);

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
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MakeChoice())));
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
          Text("Getwork",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
