import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/Employer%20job%20homePage/reportDisplay.dart';
import 'package:hybrid/Employer%20job%20homePage/reportType.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      child: ElevatedButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ReportType()));

      }, child: Text("Report post"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green)
        ),
      ),
    );
  }
}
