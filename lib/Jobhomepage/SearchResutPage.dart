import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchresultPage extends StatefulWidget {
  Map<String, dynamic>? userMap;

  searchresultPage({this.userMap,Key? key}):super(key: key);

  @override
  _searchresultPageState createState() => _searchresultPageState();
}

class _searchresultPageState extends State<searchresultPage> {



  @override
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
                            Card(
                              elevation: 15,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text('Job Type:- ' + widget.userMap!["jobType"],style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20,wordSpacing: 1),),),
                                    Text('Job Descreption:- '+widget.userMap!["jobDescrebtion"],style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20,wordSpacing: 1),),),
                                    Text('Company Location:- '+widget.userMap!["companyLocation"],style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20,wordSpacing: 1),),),
                                    Text('Company Name:- '+widget.userMap!["companyName"],style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20,wordSpacing: 1),),),
                                    Text('\$${widget.userMap!["payrate"]}'.toString(),style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                          fontSize: 20,wordSpacing: 1),)),
                                  ],
                                ),
                              ),
                            ),
                        ],
                          ),
                        ),
                ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}
