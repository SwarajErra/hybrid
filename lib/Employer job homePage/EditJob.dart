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
      print(list);
      print(userMap);
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  pushNewJob(userMap: userMap)));
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
        titleSpacing: 7,
        title: Text(
          "Getjob",
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 70, 10, 10),
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

CollectionReference postJob = FirebaseFirestore.instance.collection('PostJob');

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

Future<void> updateUser(
  String jobType,
  String companyName,
  String CompanyLocation,
  String payRate,
  String jobDescription,
) {
  return postJob
      .doc('9Lsef0HyljJ6Zr7sWPvl')
      .update({
        "jobType": jobType,
        'companyName': companyName,
        'CompanyLocation': CompanyLocation,
        'payRate': payRate.toString(),
        'job Description': jobDescription,
      })
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

class _pushNewJobState extends State<pushNewJob> {
  final Stream<QuerySnapshot> PostJobStream =
      FirebaseFirestore.instance.collection('JobType').snapshots();

  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return postJob
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.userMap);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'Assest/images/logoNew.png',
        ),
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
        backgroundColor: Color(0xff5ECC1A),
        elevation: (5),
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
                    final List storedocs = [];
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      storedocs.add(a);
                      a['id'] = document.id;
                    }).toList();

                    return Container(
                      margin: EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
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
                                decoration: InputDecoration(
                                    labelText: 'job type =>  ' +
                                        widget.userMap!["jobType"].toString()),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                                controller: companylocationController,
                                decoration: InputDecoration(
                                    labelText: 'CompanyLocation =>  ' +
                                        widget.userMap!["CompanyLocation"]
                                            .toString()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("field must not empty");
                                  }
                                },
                                onSaved: (value) {
                                  companyNameController.text = value!;
                                },
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                                controller: companyNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("field must not empty");
                                  }
                                },
                                onSaved: (value) {
                                  companylocationController.text = value!;
                                },
                                decoration: InputDecoration(
                                    labelText: 'CompanyName =>  ' +
                                        widget.userMap!["companyName"]
                                            .toString()),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20))),
                            TextFormField(
                              controller: payrateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("field must not empty");
                                }
                              },
                              onSaved: (value) {
                                companylocationController.text = value!;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Pay rate =>  ' +
                                      widget.userMap!["payRate"].toString()),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                            TextFormField(
                              controller: jobDescreptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("field must be filled");
                                }
                              },
                              onSaved: (value) {
                                jobDescreptionController.text = value!;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Job description => ' +
                                      widget.userMap!["job Description"]
                                          .toString()),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.yellowAccent)),
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
                                updateUser(
                                  jobtypeController.text,
                                  companyNameController.text,
                                  companylocationController.text,
                                  payrateController.text.toString(),
                                  jobDescreptionController.text,
                                );
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
