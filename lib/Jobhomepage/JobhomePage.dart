import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hybrid/Employer%20job%20homePage/addingAD.dart';
import 'package:hybrid/Jobhomepage/Searchbar.dart';
import 'package:hybrid/Jobhomepage/employeeProfilePage.dart';
import 'package:hybrid/drawer/Navigationdrawer.dart';
import '../Employer job homePage/EmployerHomePage.dart';

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
        leading: Image.asset(
          'Assest/images/logoNew.png',
        ),
        actionsIconTheme: IconThemeData(color: Colors.yellow, size: 36),
        backgroundColor: Color(0xff5ECC1A),
        elevation: (5),
        titleSpacing: 7,
        title: Text(
          "Getjob",
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
        ),
      ),
      endDrawer: navigationDrawer(),
      body: searchBar( key: UniqueKey(),),
    );
  }
}
