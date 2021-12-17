import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class employeerHomePage extends StatefulWidget {
  const employeerHomePage({Key? key}) : super(key: key);

  @override
  _employeerHomePageState createState() => _employeerHomePageState();
}

class _employeerHomePageState extends State<employeerHomePage> {
  String jobType = "";
  String companyName = "";
  String companyLocation = "";
  double payrate = 0.0;
  String jobDescrebtion = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    jobType = value;
                  },
                  decoration: InputDecoration(labelText: "Job type"),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                TextField(
                  onChanged: (value) {
                    companyName = value;
                  },
                  decoration: InputDecoration(labelText: "Company name"),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                TextField(
                  onChanged: (value) {
                    companyLocation = value;
                  },
                  decoration: InputDecoration(labelText: "Company location"),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                TextField(
                  onChanged: (value) {
                    payrate = value as double;
                  },
                  decoration: InputDecoration(labelText: "pay rate"),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                TextField(
                  onChanged: (value) {
                    jobDescrebtion = value;
                  },
                  decoration: InputDecoration(labelText: "job description"),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: () {},

                  style:
                  ElevatedButton.styleFrom(
                    elevation: 10,
                    padding: EdgeInsets.all(14),
                    primary: Colors.orange,
                    ),

                  child: GradientText(
                    'Post a job',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
