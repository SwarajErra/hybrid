import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './startedLogo/Launcher.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Getwork());
}
class Getwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: launcher(),
      ),
    );
  }
}

