import 'package:babybear/ui/babyface.dart';
import 'package:babybear/ui/playsound.dart';
import 'package:babybear/ui/playvoice.dart';
import 'package:babybear/State/statePage.dart';
import 'package:babybear/State/bSlider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BabyBearApp());
}

class BabyBearApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배베 - BabyBear',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BabyBear'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatePage(title: '',)),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaySound()),
                );
              },
              child: Text('목소리 녹음'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayVoice()),
                );
              },
              child: Text('아기를 위한 소리'),
            ),
            BSlider(), // 새로 추가된 BSlider 위젯
          ],
        ),
      ),
    );
  }
}