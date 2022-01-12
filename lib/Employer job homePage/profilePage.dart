import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/forms/employeeForm.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required UniqueKey key,}) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();

}


class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore? _instance;
  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }
  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('profiledata');

    DocumentSnapshot snapshot =
    await categories.doc('1p8Plcux61dRMoVcQPgm').get();
    var data = snapshot.data() as Map;
  }
 // List<profileAd> get profileadds => ProfilePage.profileadds;


  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "User Profile",style: TextStyle(
              fontSize: 40.0,
              color:Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400
          ),
          ),
          Text(
            "first_name",style: TextStyle(
              fontSize: 25.0,
              color:Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400
          ),
          ),
          SizedBox(width: 4),
          Text(
            "last_name"
            ,style: TextStyle(
              fontSize: 25.0,
              color:Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400
          ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Address"
            ,style: TextStyle(
              fontSize: 18.0,
              color:Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300
          ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "education"
            ,style: TextStyle(
              fontSize: 15.0,
              color:Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300
          ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "experience"
            ,style: TextStyle(
              fontSize: 15.0,
              color:Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300
          ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "mobile no || email"
            ,style: TextStyle(
              fontSize: 18.0,
              color:Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300
          ),
          ),
        ],
      ),
    );
  }
}
