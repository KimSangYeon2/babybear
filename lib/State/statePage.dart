import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:babybear/State/stateProvider.dart';
import 'package:babybear/State/state.dart';
import 'package:babybear/State/alert.dart';

class StatePage extends StatelessWidget {
  final AppState _babystate = AppState();

  @override
  Widget build(BuildContext context) {
    StateProvider stateProvider = Provider.of<StateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BabyBear'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<StateProvider>(
              builder: (context, stateProvider, _) {
                int currentState = stateProvider.currentStatus;
                return Text(
                  '지금 아기 상태는? : $currentState',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                stateProvider.changeStatus(1);
                sendStatusToArduino(1);
              },
              child: Text('울음'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                stateProvider.changeStatus(2);
                sendStatusToArduino(2);
              },
              child: Text('조용함'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                stateProvider.changeStatus(3);
                sendStatusToArduino(3);
              },
              child: Text('시끄러움'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                stateProvider.changeStatus(4);
                sendStatusToArduino(4);
              },
              child: Text('웃음'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                stateProvider.changeStatus(5);
                sendStatusToArduino(5);
              },
              child: Text('종료'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendStatusToArduino(int status) async {
    try {
      await _babystate.changeLEDStatus(status);
      showNotification(status);
    } catch (e) {
      print(e.toString());
    }
  }

  void showNotification(int status) {
    String title = '';
    String body = '';

    if (status == 1) {
      title = '상태가 1입니다';
      body = '진동이 계속됩니다';
    } else if (status >= 2 && status <= 4) {
      title = '상태가 $status입니다';
      body = '백그라운드 알림이 표시됩니다';
    }

    if (title.isNotEmpty && body.isNotEmpty) {
      AlertManager.showBackgroundNotification(title, body);
    }
  }
}