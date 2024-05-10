import 'package:flutter/material.dart';

class ResultScreen2 extends StatelessWidget {
  final int score;
  final String name;
  final String type;

  const ResultScreen2({
    Key? key,
    required this.score,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '$score', // 점수 출력
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name', // 이름 출력
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Type: $type', // 유형 출력
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}