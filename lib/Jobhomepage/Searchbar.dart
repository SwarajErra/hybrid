import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Jobhomepage/floatsearchbar.dart';

class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
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
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 190,
        width: 400,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text('job type ----',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.normal))),
              Text('Company name ----',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.normal))),
              Text('Company location ----',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.normal))),
              Text('Pay rate ---',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.normal))),
              Text('job description ----',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20,fontWeight:FontWeight.normal))),

            Expanded(child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: Text('Apply',style: GoogleFonts.pacifico(textStyle:TextStyle(fontSize: 20,))),
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    print('Pressed');
                  },
                )
              ],
            ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}
