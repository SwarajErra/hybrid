import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Employer%20job%20homePage/EmployerHomePage.dart';
import 'package:hybrid/Jobhomepage/JobhomePage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MakeChoice extends StatefulWidget {
  @override
  _MakeChoiceState createState() => _MakeChoiceState();
}

class _MakeChoiceState extends State<MakeChoice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.asset(
                "Assest/images/logo.png",
                height: 200,
                width: 200,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
              Text(
                "GetJob",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                )),
              ),
              SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    margin: EdgeInsets.all(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 0.5,
                          ),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff2BE52D),
                                Color(0xff73F774),
                                Color(0xffC9FC63),
                                Color(0xffDAFC74),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => jobhomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 20,

                          shadowColor: Colors.green,
                          padding: EdgeInsets.all(10),
                          primary: Colors.transparent,
                        ),
                        child: GradientText(
                          'Job Seeker',
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
                    ),
                  ),
                  SizedBox(width: 7),
                  Container(
                    height: 80,
                    margin: EdgeInsets.all(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 1,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffC9FC63),
                              Color(0xffFBFE03),
                              Color(0xffFAFFA0),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )),
                      child: ElevatedButton(

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => employeerHomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(

                          splashFactory: InkSplash.splashFactory,
                            elevation: 20,
                            shadowColor: Colors.yellow,
                            padding: EdgeInsets.all(10),
                            primary: Colors.transparent),
                        child: GradientText(
                          'Post jobs',

                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontSize: 35,
                          )),
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}
