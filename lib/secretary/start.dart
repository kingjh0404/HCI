import 'package:flutter/material.dart';
import 'package:mbtiology/secretary/check.dart';
import 'modify.dart';

class StartPage extends StatelessWidget {
  final String adminNumber;
  final String name;

  StartPage({required this.adminNumber, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),  // 배경색을 설정합니다.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(  // Center the image within the Column
                child: Image.asset('asset/images/logo.png', )  // Specify the image path and optionally set a width
            ),
            Text(
              '$name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            SizedBox(
                width: 250,
                height: 50,
                child :ElevatedButton(
                  onPressed: () {
                    // Modify 버튼을 눌렀을 때 modify.dart로 이동합니다.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ModifyPage()), // ModifyPage로 이동합니다.
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE4E4E5)), // 버튼의 배경색 설정
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 글자색을 검정색으로 설정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // 버튼 모서리를 각진 형태로 설정
                      ),
                    ),
                  ),
                  child: Text("Modify game's selection"),

                )

            ),
            SizedBox(height: 10),
            SizedBox(
                width: 250,
                height: 50,
                child :ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckPage()), // CheckPage로 이동
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE4E4E5)), // 버튼의 배경색 설정
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // 글자색을 검정색으로 설정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // 버튼 모서리를 각진 형태로 설정
                      ),
                    ),
                  ),
                  child: Text("Student List"),
                )
            ),
          ],
        ),
      ),
    );
  }
}
