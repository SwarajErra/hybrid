import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportDisplay extends StatefulWidget {
  const ReportDisplay({Key? key}) : super(key: key);

  @override
  _ReportDisplayState createState() => _ReportDisplayState();
}

class _ReportDisplayState extends State<ReportDisplay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reported successfully",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 80,
              ),
              Container(child: Text("You have successfully reported the post",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),)
            ],
          ),

        ),
      ),
    );
  }
}
