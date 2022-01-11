import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './SearchResutPage.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Employer%20job%20homePage/addingAD.dart';
import 'package:hybrid/Jobhomepage/floatsearchbar.dart';
import 'package:intl/intl.dart';
import '../Employer job homePage/EmployerHomePage.dart';

class searchBar extends StatefulWidget {
  searchBar({
    required UniqueKey key,
  }) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  FirebaseFirestore? _instance;
  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('PostJob');

    DocumentSnapshot snapshot =
        await categories.doc('IsKdGC6hMnPffOAociDU').get();
    var data = snapshot.data() as Map;
  }

  final List<addingAdd> addadds = employeerHomePage.addadds;


  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Positioned.fill(
          top: 70,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: addadds.map((tx) {
                            return Card(
                              elevation: 15,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text(
                                      'Job Type:- ' + tx.jobType,
                                      style: GoogleFonts.breeSerif(
                                        textStyle: TextStyle(
                                            fontSize: 20, wordSpacing: 1),
                                      ),
                                    ),
                                    Text(
                                      'Job Descreption:- ' + tx.jobDescrebtion,
                                      style: GoogleFonts.breeSerif(
                                        textStyle: TextStyle(
                                            fontSize: 20, wordSpacing: 1),
                                      ),
                                    ),
                                    Text(
                                      'Company Location:- ' +
                                          tx.companyLocation,
                                      style: GoogleFonts.breeSerif(
                                        textStyle: TextStyle(
                                            fontSize: 20, wordSpacing: 1),
                                      ),
                                    ),
                                    Text(
                                      'Company Name:- ' + tx.companyName,
                                      style: GoogleFonts.breeSerif(
                                        textStyle: TextStyle(
                                            fontSize: 20, wordSpacing: 1),
                                      ),
                                    ),
                                    Text('\$${tx.payrate}'.toString(),
                                        style: GoogleFonts.breeSerif(
                                          textStyle: TextStyle(
                                              fontSize: 20, wordSpacing: 1),
                                        )),
                                    Text(
                                        DateFormat('MM-dd-yyy').format(tx.date),
                                        style: GoogleFonts.breeSerif(
                                          textStyle: TextStyle(
                                              fontSize: 20, wordSpacing: 1),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        dynamicJobCard(),
                        dynamicJobCard(),
                        dynamicJobCard(),
                        dynamicJobCard(),
                        dynamicJobCard(),
                        dynamicJobCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        FloatSearchBar(),
      ],
    );
  }
}

class dynamicJobCard extends StatefulWidget {
  const dynamicJobCard({Key? key}) : super(key: key);

  @override
  _dynamicJobCardState createState() => _dynamicJobCardState();
}

class _dynamicJobCardState extends State<dynamicJobCard> {

  Map<String, dynamic>? userMap;

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('PostJob').get().then((value) {
      if (mounted) {
        setState(() {
          userMap = value.docs[0].data();
        });
      }
      print(userMap);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        shadowColor: Colors.black,
        elevation: 20,
        child: Container(
          height: 190,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('job type ----',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              Text('Company name ----',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              Text('Company location ----',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              Text('Pay rate ---',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              Text('job description ----',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      label: Text('Apply',
                          style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                            fontSize: 20,
                          ))),
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        print('Pressed');
                        onSearch();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
