import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/forms/employeeForm.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({  key,}) : super(key: key);


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
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  height: 275,
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      'https://images.unsplash.com/photo-1485160497022-3e09382fb310?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                ),
                Positioned(
                    bottom: -50.0,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            ''),
                      ),
                    ))
              ]),
          SizedBox(
            height: 35,
          ),
          ListTile(
            title: Center(child: Text('Krinesh')),
            subtitle: Center(child: Text('Patel')),
          ),
          ListTile(
            title: Text('Education'),
            subtitle: Text(
                'Bachlor Degree in Electronic and communication'),
          ),

          ListTile(
            title: Text('Experience'),
            subtitle: Text(
                '1 year as jouiner developer'),
          ),

      ListTile(
        title: Text('Contact Information'),
      ),

          ListTile(
            title: Text('Mobile No'),
            subtitle: Text('+1469955564'),
          ),

          ListTile(
            title: Text('Email Id'),
            subtitle: Text('krineshpatel6123@gmail.com'),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text('5550 ave trent, montreal'),
          ),
        ],
      ),
    );

  }
}
