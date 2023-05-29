import 'package:flutter/material.dart';
import 'state.dart';

class StatePage extends StatefulWidget {
  StatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  int _currentStatus = 0;
  final StateService _stateService = StateService();

  Future<void> _changeLEDStatus(int status) async {
    try {
      final result = await _stateService.changeLEDStatus(status);
      setState(() {
        _currentStatus = int.parse(result);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '지금 아기 상태는? : $_currentStatus',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStatus = 1;
                });
                _changeLEDStatus(1);
              },
              child: Text('울음'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStatus = 2;
                });
                _changeLEDStatus(2);
              },
              child: Text('조용함'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStatus = 3;
                });
                _changeLEDStatus(3);
              },
              child: Text('시끄러움'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStatus = 4;
                });
                _changeLEDStatus(4);
              },
              child: Text('웃음'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStatus = 5;
                });
                _changeLEDStatus(5);
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
}