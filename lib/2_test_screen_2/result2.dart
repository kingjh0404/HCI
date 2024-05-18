import 'package:flutter/material.dart';
import 'package:mbtiology/2_test_screen_2/test_screen2.dart';

import 'allPass.dart';

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
    String imagePath;
    String title;
    List<String> details = [];

    if (score <= 6) {
      imagePath = 'asset/images/to_6.png'; // Correct asset path
      title = 'Total Points less 6';
      details = [
        'You have to move out of Dormitory!',
      ];
    } else if (score > 6 && score < 10) {
      imagePath = 'asset/images/to_7.png'; // Correct asset path
      title = 'Total Points: 7~9';
      details = [
        'Be careful!',
        'The penalty points are not many, but they are not small either.',
        'What if it piles up a little more...?',
        'The floor manager knows your name!',
      ];
    } else {
      imagePath = 'asset/images/to_11.png'; // Correct asset path
      title = 'Total Points over 10';
      details = [
        'You are of the BEST RC Potato.',
        'Always selected in the first round of Dormitory selection',
        'Please continue to stay like this.',
        'A role model for new dorm students!',
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(imagePath),
              const SizedBox(height: 20),
              // Text(
              //   title,
              //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.center,
              // ),
              ...details.map((detail) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  detail,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )),
              const SizedBox(height: 20),
              if (score <= 6)
                ElevatedButton(
                  onPressed: () {
                    // Modify 버튼을 눌렀을 때 modify.dart로 이동합니다.
                    Navigator.push(
                      context,
                      //MaterialPageRoute(builder: (context) => ModifyPage()), // ModifyPage로 이동합니다.
                      MaterialPageRoute(builder: (context) => const Period2(name: '', type: '',)),
                    );
                  },
                  child: const Text('Retry'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                  ),
                ),
              if (score > 6)
                ElevatedButton(
                  onPressed: () {
                    // Modify 버튼을 눌렀을 때 modify.dart로 이동합니다.
                    Navigator.push(
                      context,
                      //MaterialPageRoute(builder: (context) => ModifyPage()), // ModifyPage로 이동합니다.
                      MaterialPageRoute(builder: (context) => AllPass())
                    );
                  },
                  child: const Text('Next Page'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
