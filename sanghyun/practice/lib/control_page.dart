import 'package:flutter/material.dart';
import 'dpad_control.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Circulator Controller',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 100),
            DpadControl(),
          ],
        ),
      ),
    );
  }
}
