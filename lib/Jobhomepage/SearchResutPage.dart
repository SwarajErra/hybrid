import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Jobhomepage/JobhomePage.dart';
import 'package:hybrid/startedLogo/MakeChoice.dart';
import './floatsearchbar.dart';
import 'package:getwidget/getwidget.dart';


class searchresultPage extends StatefulWidget {
  String selectedTerm;

  searchresultPage({required this.selectedTerm, Key? key}) : super(key: key);

  @override
  searchresultPageState createState() => searchresultPageState();
}

class searchresultPageState extends State<searchresultPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? userMap;

  bool isLoading = false;
  String? _uid;

 void onSearch() async {

    User? user = _auth.currentUser;
    _uid = user?.uid;

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore
        .collection('PostJob')
        .where("jobType", isEqualTo: widget.selectedTerm.toLowerCase())
        .get()
        .then((value) {
      if (mounted) {
        setState(() {
          userMap = value.docs[0].data();
          isLoading = true;
        });
      }
      print(userMap);
    });
  }


  @override
  Widget build(BuildContext context) {


    if(isLoading != true) {
      onSearch();
    }
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              top: 200,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [

                       DynamicCard(userMap: userMap),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicCard extends StatefulWidget {
  Map<String, dynamic>? userMap;

  DynamicCard({this.userMap});

  @override
  _DynamicCardState createState() => _DynamicCardState();
}

class _DynamicCardState extends State<DynamicCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.userMap);
    return SingleChildScrollView(child:
      Column(
        children: <Widget>[
          widget.userMap != null
              ? Card(
            //color: Colors.grey[300],
                  elevation: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    width: 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(2)),
                        Text(
                          'Job Type:- ' +
                              widget.userMap?['jobType'],
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            fontSize: 22,color: Colors.blue,fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,),
                        ),
                        Text(
                          'Company Location:- ' +
                              widget.userMap?['CompanyLocation'],
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            fontSize: 22,color: Colors.blue,fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,),
                        ),

                        Text(
                          'Company Name:- ' + widget.userMap?['companyName'],
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            fontSize: 22,color: Colors.blue,fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                            'Pay rate :- ' +
                                '\$${widget.userMap?['payRate']}'.toString(),
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headline6,
                              fontSize: 22,fontWeight: FontWeight.w600, color: Colors.blue,
                              fontStyle: FontStyle.italic,
                            )),
                        Text(
                          'Job Descreption:- ' +
                              widget.userMap?['jobDescription'],
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            fontSize: 22,fontWeight: FontWeight.w600, color: Colors.blue,
                            fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        ElevatedButton(onPressed: (){
                          Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => MakeChoice()));

                        }, child: Text("<- get Back",
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            fontSize: 20,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,),
                        ),),
                           // SizedBox(width: 50,),
                            ElevatedButton.icon(
                              label: Text('Apply',
                                  style: GoogleFonts.pacifico(
                                      textStyle: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20,
                                      ))),
                              icon: Icon(Icons.favorite,color: Colors.red,),
                              onPressed: () {
                                print('Pressed');
                              },
                            ),
      ],
                        ),
                      ],
                    ),
                  ),
                )

              : GFCard(
              boxFit: BoxFit.cover,
            buttonBar: GFButtonBar(
              children: <Widget> [
                Text("Sorry no result found, try searching with job types",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.bodyText2,
                fontSize: 38,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,),),
                ElevatedButton(onPressed: (){

                  Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => MakeChoice()));

                }, child: Text("<- get Back",
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyText2,
                    fontSize: 20,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,),
                )),

              ],)

          ),
        ],
      ),
      );

  }
}
