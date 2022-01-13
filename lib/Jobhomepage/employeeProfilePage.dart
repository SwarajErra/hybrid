import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: EmployeeProfilePage(),
    ));

class EmployeeProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [Colors.redAccent, Colors.pinkAccent])),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(1, 40, 1, 1),
                    width: double.infinity,
                    height: 683,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("Assest/1598083178379.png"),
                            radius: 80.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'First Name:- ',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Last Name:- ',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(children: [
                           Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 22.0),
                            child:  Text(
                                'Education:- '+ '---------------------------------------------------------------------------'
                                    '-------------------------------------------------------------------------------------',
                                style: GoogleFonts.lato(
                                  textStyle:
                                  Theme.of(context).textTheme.subtitle1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child:  Text(
                                'Experience:- '+ '---------------------------------------------------------------------------'
                                    '-------------------------------------------------------------------------------------',
                                style: GoogleFonts.lato(
                                  textStyle:
                                  Theme.of(context).textTheme.subtitle1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child:  Text(
                                'Adress:- '+ '---------------------------------------------------------------------------',
                                style: GoogleFonts.lato(
                                  textStyle:
                                  Theme.of(context).textTheme.subtitle1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),

              Positioned(
                bottom: 30,
                left: 50,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300.00,
                    child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        elevation: 0.0,
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Colors.redAccent, Colors.black]),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Contact me",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
