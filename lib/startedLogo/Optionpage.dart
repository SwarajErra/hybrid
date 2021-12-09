import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              SizedBox(height:100),
              Image.asset("Assest/images/logo.png",height: 200,width: 200,alignment: Alignment.center,fit:BoxFit.fill,),
              Text("GetJob",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.normal,)),),
              SizedBox(height: 60),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2BE52D),
                                    Color(0xff73F774),
                                    Color(0xffC9FC63)
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
                              padding: EdgeInsets.all(18),
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
                      ],
                    ),
                    SizedBox(width: 7),
                    Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 20,
                                padding: EdgeInsets.all(18),
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
                      ],
                    ),
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
