import 'package:flutter/material.dart';

class BabyFace extends StatelessWidget {
  final int babyfaceState;

  BabyFace({required this.babyfaceState});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String text;
    Color iconColor;

    switch (babyfaceState) {
      case 1:
        icon = Icons.child_care;
        text = '아기가 울고있어요!';
        iconColor = Colors.red;
        break;
      case 2:
        icon = Icons.child_care;
        text = '조용해요.';
        iconColor = Colors.green;
        break;
      case 3:
        icon = Icons.child_care;
        text = '시끄러워요.';
        iconColor = Colors.yellow;
        break;
      case 4:
        icon = Icons.child_care;
        text = '아기가 웃고있어요!';
        iconColor = Colors.blue;
        break;
      case 5:
        icon = Icons.child_care;
        text = 'Off';
        iconColor = Colors.grey;
        break;
      default:
        icon = Icons.child_care;
        text = '';
        iconColor = Colors.black;
    }

    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: iconColor,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}