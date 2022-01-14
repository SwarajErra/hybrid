



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import './postjob.dart';

class editJob extends StatefulWidget {
  const editJob({Key? key}) : super(key: key);

  @override
  _editJobState createState() => _editJobState();
}

class _editJobState extends State<editJob> {
  @override
  Map<String, dynamic>? userMap;
  var list = [];
  CollectionReference PostJob =
      FirebaseFirestore.instance.collection("PostJob");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onSearch();
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('PostJob').get().then((value) {
      if (mounted) {
        setState(() {
          userMap = value.docs[0].data();
          for (var i = 0; i < value.docs.length; i++) {
            list.add(value.docs[i].data());
          }
        });
      }
    });
  }

  deleteUser() async {
   await FirebaseFirestore.instance
        .collection("PostJob")
        .where("jobType", isEqualTo : userMap!["jobType"])
        .get().then((value){
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection("PostJob").doc(element.id).delete().then((value){
          {
            Fluttertoast.showToast(msg: "Job deleted refresh the page");
          }
        });
      });
    });
  }

  dynamicCard(userMap) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.all(10),
      shadowColor: Colors.blue,
      elevation: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: 380,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Type:- ' + userMap!["jobType"],
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.subtitle1,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Company Location:- ' + ' ${userMap!["CompanyLocation"]}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline6,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Company Name:- ' + ' ${userMap!["companyName"]}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline6,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text('Pay rate :- ' + '\$${userMap?['payRate']}'.toString(),
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline6,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  )),
              Text(
                'Job Descreption:- ' + ' ${userMap!["job Description"]}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline6,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        shadowColor:
                            MaterialStateProperty.all(Colors.yellowAccent)),
                    label: Text('Edit',
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ))),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  pushNewJob(userMap: userMap)));
                    },
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        shadowColor:
                            MaterialStateProperty.all(Colors.yellowAccent)),
                    label: Text('Delete',
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ))),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                                  deleteUser();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'Assest/images/logoNew.png',
        ),
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
        backgroundColor: Color(0xff5ECC1A),
        elevation: (5),
        shadowColor: Colors.blue,
        titleSpacing: 7,
        title: Text(
          "Getjob",
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
            width: double.infinity,
            child: Column(
              children: [for (var i in list) dynamicCard(i)],
            )),
      ),
    );
  }
}

class pushNewJob extends StatefulWidget {
  Map<String, dynamic>? userMap;

  pushNewJob({this.userMap, Key? key}) : super(key: key);

  @override
  _pushNewJobState createState() => _pushNewJobState();
}



final jobtypeController = TextEditingController();
final companyNameController = TextEditingController();
final jobDescreptionController = TextEditingController();
final companylocationController = TextEditingController();
final payrateController = TextEditingController();
String? jobtype;

String? companyName;
String? companyLocation;
String? jobDescreption;
double? payRate;
final _formKey = GlobalKey<FormState>();



clearText() {
  companyNameController.clear();
  companylocationController.clear();
  payrateController.clear();
  jobDescreptionController.clear();
  jobtypeController.clear();
}

class _pushNewJobState extends State<pushNewJob> {

  CollectionReference postJob = FirebaseFirestore.instance.collection('PostJob');
  @override
  void initState(){
  //  getUser();
    super.initState();
  }
  List storedocs = [];
  getUser() async {
    var querySnapshots = await postJob.get();
    for (var snapshot in querySnapshots.docs) {
     storedocs = snapshot.id as List;
    }
  }
  Object updateUser(
      String jobType,
      String companyName,
      String CompanyLocation,
      String payRate,
      String jobDescription,
      ) {
    if (_formKey.currentState!.validate()) {
      return postJob
          .doc('9Lsef0HyljJ6Zr7sWPvl')
          .update({
        "jobType": jobType,
        'companyName': companyName,
        'CompanyLocation': CompanyLocation,
        'payRate': payRate.toString(),
        'job Description': jobDescription,

      })
          .then((value) => Fluttertoast.showToast(msg: "Job has been Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    return {
      Fluttertoast.showToast(msg: "Error")
    };

  }



  String? ID;
  @override
  Widget build(BuildContext context) {

      getUser();
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'Assest/images/logoNew.png',
        ),
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
        backgroundColor: Color(0xff5ECC1A),
        elevation: (5),
        shadowColor: Colors.yellow,
        titleSpacing: 7,
        title: Text(
          "Getjob",
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('students')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final FirebaseAuth auth = FirebaseAuth.instance;
              final Stream<QuerySnapshot> PostJobStream =
              FirebaseFirestore.instance.collection('JobType').snapshots();

              return StreamBuilder<QuerySnapshot>(
                  stream: PostJobStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: jobtypeController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("field must not empty");
                                  }
                                  else {
                                    onSaved:
                                        (value) {
                                      jobtypeController.text = value!;
                                    };
                                }
                                },
                                decoration: InputDecoration(
                                    labelText: 'job type  ' ),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                                controller: companylocationController,
                                decoration: InputDecoration(
                                    labelText: 'CompanyLocation  '
                                            .toString()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("field must not empty");
                                  }
                                  else {
                                    onSaved:
                                        (value) {
                                      companylocationController.text = value!;
                                    };
                                  }
                                },
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                                controller: companyNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("field must not empty");
                                  }
                                  else {
                                    onSaved:
                                        (value) {
                                      companyNameController.text = value!;
                                    };
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'CompanyName  ' ),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                              controller: payrateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("field must not empty");
                                }
                                else {
                                  onSaved:
                                      (value) {
                                    payrateController.text = value!;
                                  };
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Pay rate   ' ),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                            TextFormField(
                              controller: jobDescreptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("field must not empty");
                                }
                                else {
                                  onSaved:
                                      (value) {
                                    jobDescreptionController.text = value!;
                                  };
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Job description  '),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton.icon(
                              style:
                                ElevatedButton.styleFrom(
                                  elevation: 15,
                                  padding: EdgeInsets.fromLTRB(20,10 , 20, 10),
                                  shape: StadiumBorder(),
                                  primary: Colors.green,
                                  shadowColor: Colors.yellow,
                                ),
                              label: Text('Update',
                                  style: GoogleFonts.pacifico(
                                      textStyle: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                  ))),
                              icon: Icon(
                                Icons.update,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print(ID);
                                updateUser(
                                  jobtypeController.text,
                                  companyNameController.text,
                                  companylocationController.text,
                                  payrateController.text.toString(),
                                  jobDescreptionController.text,
                                );
                                clearText();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
