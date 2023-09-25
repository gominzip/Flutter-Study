import 'package:flutter/material.dart';

class DpadControl extends StatelessWidget {
  DpadControl();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              iconData: Icons.filter_1,
              pressedButton: 'One',
              size: 60,
              buttonColor: Colors.red,
            ),
            SizedBox(width: 20),
            DPadButton(
              iconData: Icons.filter_2,
              pressedButton: 'Two',
              size: 60,
              buttonColor: Colors.red,
            ),
            SizedBox(width: 20),
            DPadButton(
              iconData: Icons.filter_3,
              pressedButton: 'Three',
              size: 60,
              buttonColor: Colors.red,
            ),
          ],
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              iconData: Icons.arrow_circle_up,
              pressedButton: 'Up',
              buttonColor: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              iconData: Icons.arrow_circle_left_outlined,
              pressedButton: 'Left',
              buttonColor: Colors.blue,
            ),
            SizedBox(width: 100),
            DPadButton(
              iconData: Icons.arrow_circle_right_outlined,
              pressedButton: 'Right',
              buttonColor: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              iconData: Icons.arrow_circle_down_outlined,
              pressedButton: 'Down',
              buttonColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

class DPadButton extends StatelessWidget {
  final directionsToSymbols = {
    'Up': '↑',
    'Down': '↓',
    'Left': '←',
    'Right': '→',
    'One': '1',
    'Two': '2',
    'Three': '3',
  };
  final IconData iconData;
  final Color buttonColor;
  final String pressedButton;
  final double size;

  DPadButton({
    required this.iconData,
    required this.pressedButton,
    this.buttonColor = Colors.indigo,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size * 1.25,
      height: this.size * 1.25,
      child: TextButton(
        onPressed: () => _onButtonPressed(this.pressedButton),
        child: Icon(
          iconData,
          size: this.size,
          color: Colors.white,
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: buttonColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(String direction) {
    // 여기에 블루투스 모듈 추가할 것
    print('Button Pressed: ${directionsToSymbols[direction]}');
  }
}
