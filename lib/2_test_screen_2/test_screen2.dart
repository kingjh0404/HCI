import 'package:flutter/material.dart';
import 'package:mbtiology/common/common_value.dart';
import 'package:mbtiology/common/default_layout.dart';
import 'package:mbtiology/2_test_screen_2/questions2.dart' as questions;
import 'package:mbtiology/2_test_screen_2/result2.dart'; // 결과 페이지 import

class Period2 extends StatefulWidget {
  final String name;
  final String type;

  const Period2({
    required this.name,
    required this.type,
    Key? key, // Key 타입의 매개변수 추가
  }) : super(key: key); // super 호출 수정

  @override
  State<Period2> createState() => _TestScreenState();
}

class _TestScreenState extends State<Period2> {
  var pageController = PageController();
  var page = 0; // 페이지 인덱스를 0으로 시작
  List<int> myAns = [];
  int score = 0;
  final List<String> answers = ['b', 'b','a','a','a','a','a','b','a','a']; // 정답 리스트
  
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
            height: 400,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: questions.mbti_qs.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, // Center align horizontally
                  children: [
                    if (questions.mbti_qs[index]['image'] != null)
                      Center(
                        child: Image.asset(
                          questions.mbti_qs[index]['image']!,
                          height: 170, // Set an appropriate height for the image
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 10),
                    Text(
                      '${questions.mbti_qs[index]['order']}. ${questions.mbti_qs[index]['question']}',
                      style: defaultTextStyle,
                      textAlign: TextAlign.center, // Center align text
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Choose an answer',
            style: defaultTextStyle,
          ),
          const SizedBox(height: 20),
          // 보기 a, b
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (page < questions.mbti_qs.length) {
                    myAns.add(0); // Add option 'a' to answers list
                    // Check if the selected answer is correct
                    if (questions.mbti_qs[page]['correct'] == 'a') {
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
                  'a. ${questions.mbti_qs[page]['ans_a']}',
                  style: defaultTextStyle,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (page < questions.mbti_qs.length) {
                    myAns.add(1); // Add option 'b' to answers list
                    // Check if the selected answer is correct
                    if (questions.mbti_qs[page]['correct'] == 'b') {
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
                  'b. ${questions.mbti_qs[page]['ans_b']}',
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
    // 마지막 페이지인지 확인
    bool isLastPage = (page == questions.mbti_qs.length - 1);

    // Check if the selected answer is correct
    if (myAns[page] == (answers[page] == 'a' ? 0 : 1)) {
      score++; // Increment score if the answer is correct
    }

    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        page++;
      });
    } else {
      // 마지막 문제일 때 결과 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen2(
            score: score, // 점수 전달
            name: widget.name, // 이름 전달
            type: widget.type, // 유형 전달
          ),
        ),
      );
    }
  }

  AppBar renderAppBar() {
    return AppBar(
      foregroundColor: Colors.black,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2nd period', 
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "General Rules, Guidance for Life, and Counseling",
            style: TextStyle(
              fontSize: 10,
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
