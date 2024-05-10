import 'package:flutter/material.dart';
import 'package:mbtiology/student/start2.dart';
// import 'startpage.dart'; // 추가

class ProfilePage extends StatelessWidget {
  final String adminNumber;
  final String name;

  ProfilePage({required this.adminNumber, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFD9D9D9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Let\'s start',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'RC penalty game!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  Center(  // Center the image within the Column
                      child: Image.asset('asset/images/logo.png', width: 373,height: 200,)  // Specify the image path and optionally set a width
                  ),

                  Text(
                    '$adminNumber',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$name',
                    style: TextStyle(fontSize: 18),
                  ),
                  // SizedBox(height: 10),  // Add some space before the image

                  SizedBox(height: 200,)
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartPage(
                        adminNumber: adminNumber,
                        name: name,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xFFB4B4B4), // 텍스트 색상을 검정색으로 설정합니다.
                ),
                child: Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFD9D9D9),
    );
  }
}
