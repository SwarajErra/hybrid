import 'package:flutter/material.dart';
import './startedLogo/Launcher.dart';

void main()=> runApp(Getwork());

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
