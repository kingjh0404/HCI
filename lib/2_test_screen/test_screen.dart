import 'package:flutter/material.dart';

import 'package:mbtiology/common/common_value.dart';
import 'package:mbtiology/common/default_layout.dart';
import 'package:mbtiology/2_test_screen/questions.dart' as questions;
// import 'package:mbtiology/2_test_screen/result.dart'
import 'package:mbtiology/2_test_screen/result.dart'; // Add semicolon at the end

// import 'result.dart';

// 전역 변수로 점수 선언
int score = 0;

class TestScreen extends StatefulWidget {
  final String name;
  final String type;
  
  const TestScreen({
    required this.name,
    required this.type,
    super.key,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var pageController = PageController();
  var page = 1;
  List<int> myAns = [];

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.black,
    );

    return DefaultLayout(
      appBar: renderAppBar(),
      body: ListView(
        children: [
          const Text(
            '⭐️ Please read carefully and respond thoughtfully.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 20),

          // 문제 container
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Black border
                width: 1, // Border width
              ),
            ),
            height: 300,

            // 문제 context
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: questions.mbti_qs.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${questions.mbti_qs[index]['order']}. ${questions.mbti_qs[index]['question']}',
                      style: defaultTextStyle,
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'choose an answer',
            style: defaultTextStyle,
          ),
          const SizedBox(height: 20),
          // 보기 a, b
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (page <=11) {
                    myAns.add(0); // Add option 'a' to answers list
                    // Check if the selected answer is correct
                    if (myAns[page - 1] == 0 && questions.mbti_qs[page - 1]['correct'] == 'a') {
                      score++; // Increment score if the answer is correct
                    }
                    nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonValue.paperColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    side: const BorderSide(
                      color: Colors.black, // Black border
                      width: 1, // Border width
                    ),
                  ),
                ),
                child: Text(
                  'a. ${questions.mbti_qs[page - 1]['ans_a']}',
                  style: defaultTextStyle,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (page <= 11) {
                    myAns.add(1); // Add option 'b' to answers list
                    // Check if the selected answer is correct
                    if (myAns[page - 1] == 1 && questions.mbti_qs[page - 1]['correct'] == 'b') {
                      score++; // Increment score if the answer is correct
                    }
                    nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonValue.paperColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    side: const BorderSide(
                      color: Colors.black, // Black border
                      width: 1, // Border width
                    ),
                  ),
                ),
                child: Text(
                  'b. ${questions.mbti_qs[page - 1]['ans_b']}',
                  style: defaultTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void nextPage() {
    if (page < 11) {
      if (myAns.length < page) {
        myAns.add(0); // Default answer if not answered
      }
      pageController.animateToPage(
        page++,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {});
    } else {
      // 마지막 문제일 때 결과 페이지로 이동
      Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultScreen2(
      score: score,
      name: widget.name, // 이름 전달
      type: widget.type, // 유형 전달
    ),
  ),
);

    }
  }
  
  renderAppBar() {
    return AppBar(
      foregroundColor: Colors.black,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1st period',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Entry and Residence",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: CommonValue.paperColor,
      elevation: 0,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.black,
          width: CommonValue.commonWidth,
        ),
      ),
    );
  }
}
