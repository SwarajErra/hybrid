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
                          Text(
                            "Tejveer singh",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 22.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Job applied",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "3",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Followers",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "555",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                bottom: 150,
                child: Align(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Bio:",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'My name is Tejveer and I am  a \n'
                                'freelance mobile app developper if you \n'
                                'need any mobile app for your company \n'
                                'then contact me for more informations',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
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
