import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:babybear/State/statePage.dart';
import 'package:babybear/State/stateProvider.dart';
import 'package:babybear/ui/babyface.dart';
import 'package:babybear/ui/playsound.dart';
import 'package:babybear/ui/playvoice.dart';
import 'package:babybear/State/bSlider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateProvider(),
      child: BabyBearApp(),
    ),
  );
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
                MaterialPageRoute(builder: (context) => StatePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BabyFace(),
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
            BSlider(),
          ],
        ),
      ),
    );
  }
}