import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class jobhomePage extends StatefulWidget {
  const jobhomePage({Key? key}) : super(key: key);

  @override
  _jobhomePageState createState() => _jobhomePageState();
}

class _jobhomePageState extends State<jobhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),

        backgroundColor:  Color(0xff5ECC1A),
        //centerTitle: true,
        title: Text("Get Job",style: GoogleFonts.roboto(fontSize: 20),),
      ),
        body: Container(

        ),
    );
  }
}
