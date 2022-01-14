import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Employer%20job%20homePage/EditJob.dart';
import 'package:hybrid/Jobhomepage/Searchbar.dart';
import './addingAD.dart';
import 'package:hybrid/Jobhomepage/JobhomePage.dart';
import 'package:hybrid/Employer%20job%20homePage/profilePage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:intl/intl.dart';
import './postjob.dart';

class employeerHomePage extends StatefulWidget {
  static List<addingAdd> addadds = [
    addingAdd(
        jobType: 'partTime',
        companyName: 'Home Depot',
        jobDescrebtion: 'we are the best warehouse in montreal',
        companyLocation: 'montreal',
        payrate: 60.0)
  ];

  const employeerHomePage({Key? key}) : super(key: key);

  @override
  _employeerHomePageState createState() => _employeerHomePageState();
}

class _employeerHomePageState extends State<employeerHomePage> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference PostJob =
      FirebaseFirestore.instance.collection("PostJob");

  late final Function addTx;
  String jobType = "";
  String companyName = "";
  String CompanyLocation = "";
  double payRate = 0.0;
  String jobDescription = "";

  final jobtypeController = TextEditingController();
  final companyNameController = TextEditingController();
  final jobDescreptionController = TextEditingController();
  final companylocationController = TextEditingController();
  final payrateController = TextEditingController();

  static List<addingAdd> addadds = [
    addingAdd(
        jobType: 'partTime',
        companyName: 'Home Depot',
        jobDescrebtion: 'we are the best warehouse in montreal',
        companyLocation: 'montreal',
        payrate: 60.0)
  ];

  void list1(
    String txJobType,
    String txcompanyLocation,
    String txcompanyName,
    double txpayrate,
    String txJobDescription,
  ) {
    final newTx = addingAdd(
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
        body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                      controller: jobtypeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("field must not empty");
                        }
                      },
                      onSaved: (value) {
                        jobtypeController.text = value!;
                      },
                      decoration: InputDecoration(labelText: "Job type"),
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20))),
                  TextFormField(
                      controller: companyNameController,
                      decoration: InputDecoration(labelText: "Company name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("field must not empty");
                        } else {
                          onSaved:
                          (value) {
                            companyNameController.text = value!;
                          };
                        }
                      },
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20))),
                  TextFormField(
                      controller: companylocationController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("field must not empty");
                        } else {
                          onSaved:
                          (value) {
                            companylocationController.text = value!;
                          };
                        }
                      },
                      decoration:
                          InputDecoration(labelText: "Company location"),
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20))),
                  TextFormField(
                    controller: payrateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("field must not empty");
                      } else {
                        onSaved:
                        (value) {
                          companylocationController.text = value!;
                        };
                      }
                    },
                    decoration: InputDecoration(labelText: "pay rate"),
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                  ),
                  TextFormField(
                    controller: jobDescreptionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("field must be filled");
                      } else {
                        onSaved:
                        (value) {
                          jobDescreptionController.text = value!;
                        };
                      }
                    },
                    decoration: InputDecoration(labelText: "job description"),
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        pushData(
                            jobtypeController.text,
                            companyNameController.text,
                            companylocationController.text,
                            payrateController.text.toString(),
                            jobDescreptionController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        padding: EdgeInsets.all(14),
                        primary: Colors.green,
                        shape: StadiumBorder(),
                        shadowColor: Colors.yellow,
                      ),
                      icon: Icon(Icons.post_add),
                      label: Text(
                        "Post a Job",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline6,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,

                        ),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => editJob()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.yellow,
                      elevation: 10,
                      padding: EdgeInsets.all(14),
                      primary: Colors.green,
                      shape: StadiumBorder(),
                    ),
                      icon: Icon(Icons.edit),
                      label: Text(
                        "Edit Job",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline6,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pushData(String jobType, String companyName, String CompanyLocation,
      String payRate, String jobDescription) async {
    if (_formKey.currentState!.validate()) {
      await PostJob.add({
        "jobType": jobType,
        'companyName': companyName,
        'CompanyLocation': CompanyLocation,
        'payRate': payRate.toString(),
        'job Description': jobDescription,
      }).then((value) => {});
      {
        Fluttertoast.showToast(msg: "Job posted Successful");
      }
      clearText();
    }
  }
  clearText() {
    companyNameController.clear();
    companylocationController.clear();
    payrateController.clear();
    jobDescreptionController.clear();
    jobtypeController.clear();
  }
}
