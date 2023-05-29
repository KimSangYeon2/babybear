import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:babybear/State/stateProvider.dart';

class BabyFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StateProvider stateProvider = Provider.of<StateProvider>(context);

    int babyfaceState = stateProvider.currentStatus;

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
        text = 'Off';
        iconColor = Colors.grey;
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