import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Jobhomepage/Searchbar.dart';
import './addingAD.dart';
import 'package:hybrid/Jobhomepage/JobhomePage.dart';
import 'package:hybrid/Employer%20job%20homePage/profilePage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:intl/intl.dart';

class employeerHomePage extends StatefulWidget {
  static List<addingAdd> addadds = [
    addingAdd(
        jobType: 'partTime',
        companyName: 'Home Depot',
        jobDescrebtion: 'we are the best warehouse in montreal',
        companyLocation: 'montreal',
        date: DateTime.now(),
        payrate: 60.0)
  ];
  const employeerHomePage({Key? key}) : super(key: key);

  @override
  _employeerHomePageState createState() => _employeerHomePageState();
}

class _employeerHomePageState extends State<employeerHomePage> {
  late final Function addTx;
  String jobType = "";
  String companyName = "";
  String companyLocation = "";
  double payrate = 0.0;
  String jobDescrebtion = "";

  final jobtypeController = TextEditingController();
  final companyNameController = TextEditingController();
  final jobDescreptionController = TextEditingController();
  final companylocationController= TextEditingController();
  final  payrateController = TextEditingController();

  static List<addingAdd> addadds = [
    addingAdd(
        jobType: 'partTime',
        companyName: 'Home Depot',
        jobDescrebtion: 'we are the best warehouse in montreal',
        companyLocation: 'montreal',
        date: DateTime.now(),
        payrate: 60.0)
  ];



  void list1(String txJobType,String txcompanyLocation,String txcompanyName,double txpayrate,String txJobDescription,) {
    final newTx = addingAdd(
      date: DateTime.now(),
      companyLocation: txcompanyLocation,
      payrate: txpayrate,
      jobDescrebtion: txJobDescription,
      companyName: txcompanyName,
      jobType: txJobType,
    );

    setState(() {
      addadds.add(newTx);
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'Assest/images/logoNew.png',
          ),
          actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
          backgroundColor: Colors.green,
          elevation: (5),
          titleSpacing: 7,
          title: Text(
            "Job details",
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          key: UniqueKey(),
                        )));
              },
              child: Icon(
                Icons.account_circle,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: jobtypeController,
                    // onChanged: (value) {
                    // jobType = value;
                    // },
                    decoration: InputDecoration(labelText: "Job type"),
                    style:
                    GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20))),
                TextField(
                  //    onChanged: (value) {
                  //    companyName = value;
                  // },
                    controller: companyNameController,
                    decoration: InputDecoration(labelText: "Company name"),
                    style:
                    GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20))),
                TextField(
                  //     onChanged: (value) {
                  //     companyLocation = value;
                  //   },
                    controller: companylocationController,
                    decoration: InputDecoration(labelText: "Company location"),
                    style:
                    GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20))),
                TextField(
                  //     onChanged: (value) {
                  //     payrate = value as double;
                  //   },
                  controller: payrateController,
                  decoration: InputDecoration(labelText: "pay rate"),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                ),
                TextField(
                  //     onChanged: (value) {
                  //      jobDescrebtion = value;
                  //    },
                  controller: jobDescreptionController,
                  decoration: InputDecoration(labelText: "job description"),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                ),
                Column(
                  children: addadds.map((tx) {
                    return Card(
                      elevation: 10,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            Text(tx.jobType,style: TextStyle(color: Colors.purple),),
                            Text(tx.jobDescrebtion),
                            Text(tx.companyLocation),
                            Text(tx.companyName),
                            Text('\$${tx.payrate}'.toString()),
                            Text(DateFormat('MM-dd-yyy').format(tx.date)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    list1(
                      companyNameController.text,
                      companylocationController.text,
                      jobDescreptionController.text,
                      double.parse(payrateController.text),
                      jobtypeController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    padding: EdgeInsets.all(14),
                    primary: Colors.green,
                    shape: StadiumBorder(),
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
