import 'package:flutter/material.dart';
import 'package:mbtiology/2_test_screen/test_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://rc.handong.edu/');

class StartPage extends StatelessWidget {
  final String adminNumber;
  final String name;

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  const StartPage({Key? key, required this.adminNumber, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),  // Set the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(  // Center the image within the Column
              child: Image.asset('asset/images/logo.png'),  // Specify the image path
            ),
            // Text(
            //   '$name ($adminNumber)',
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 50),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to TestScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestScreen(name: '', type: '')),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE4E4E5)), // Set the button background color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set the text color to black
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), // Make the button corners sharp
                    ),
                  ),
                ),
                child: const Text("Take Test"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: _launchUrl,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE4E4E5)), // Set the button background color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set the text color to black
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), // Make the button corners sharp
                    ),
                  ),
                ),
                child: const Text("Study For Test"),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
