import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MakeChoice extends StatefulWidget {
  @override
  _MakeChoiceState createState() => _MakeChoiceState();
}

class _MakeChoiceState extends State<MakeChoice> {
  int _volume = 0;
  Color myColor = Color(0xff123456);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style1 = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 36, color: Colors.yellow));
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent),
                          child: GradientText(
                            'Job Seeker',
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
                Column(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffC9FC63),
                                Color(0xffDFEF11),
                                Color(0xffEEF50B),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent),
                          child: GradientText(
                            'Post jobs',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 40.5,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
