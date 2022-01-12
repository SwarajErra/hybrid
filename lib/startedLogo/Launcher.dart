import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/signin/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/signin/user_model.dart';

class launcher extends StatefulWidget {
  @override
  _launcherState createState() => _launcherState();
}

class _launcherState extends State<launcher> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser = UserModel();




  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    } );

     super.initState();
      Timer(
          Duration(seconds: 5),
              () =>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          signIn(key: UniqueKey()))));

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 150, 10, 10),
      height: 400,
      width: 400,
      child: Column(
        children: [
          Image.asset("Assest/images/logoNew.png", width: 200, height: 300),
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
