import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/Employer%20job%20homePage/reportDisplay.dart';

class ReportType extends StatefulWidget {
  const ReportType({Key? key}) : super(key: key);

  @override
  _ReportTypeState createState() => _ReportTypeState();
}
enum TypeOfReport { Abusive, Fake, Irrelevant }

class _ReportTypeState extends State<ReportType> {

  TypeOfReport _report = TypeOfReport.Abusive;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Report",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Report"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            children: [
         Row(
           children: [
             Radio(value: TypeOfReport.Abusive,
               groupValue: _report,
               onChanged: (TypeOfReport? value) {
                 setState(() {
                   _report = value!;
                 });
               },

             ),
             SizedBox(
               width: 10.0,
             ),
             Text("Abusive",style: TextStyle(fontSize: 20),)
           ],
         ),
              Row(
                children: [
                  Radio(value: TypeOfReport.Fake,
                    groupValue: _report,
                    onChanged: (TypeOfReport? value) {
                      setState(() {
                        _report = value!;
                      });
                    },

                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Fake",style: TextStyle(fontSize: 20),)
                ],
              ),
              Row(
                children: [
                  Radio(value: TypeOfReport.Irrelevant,
                    groupValue: _report,
                    onChanged: (TypeOfReport? value) {
                      setState(() {
                        _report = value!;
                      });
                    },

                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Irrelevant",style: TextStyle(fontSize: 20),)
                ],
              ),
              Container(
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ReportDisplay()));
                },
                  child: Text("Submit"),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
