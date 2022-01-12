import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notifications",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          backgroundColor: Colors.green,
        ),
        body: Container(

            child:ListView(
              children: const <Widget>[

                Card(
                  child: ListTile(
                    title: Text('Notification 1'),

                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Notification 2'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Notification 2'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Notification 3'),

                  ),
                ),
                Card(
                  child: ListTile(

                    title: Text('Notification 4'),

                  ),
                ),
                Card(
                  child: ListTile(

                    title: Text('Notification 5'),

                  ),
                ),
              ],
            )

        ),
      ),
    );
  }
}
