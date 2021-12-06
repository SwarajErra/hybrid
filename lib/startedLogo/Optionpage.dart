import 'package:flutter/material.dart';

class MakeChoice extends StatefulWidget {
  @override
  _MakeChoiceState createState() => _MakeChoiceState();
}

class _MakeChoiceState extends State<MakeChoice> {
  int _volume = 0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style1 = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 36, color: Colors.yellow));
    return Container(
      color: Colors.red,
      child: Expanded(
        child: Row(
          children: [
            Column(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    style: style1,
                    child: Text("Job seeker"),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    style: style1,
                    child: Text("Employeer"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
