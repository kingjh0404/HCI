import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AllPass extends StatelessWidget {
  const AllPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // This centers the column itself to the middle of the screen vertically
          children: [
            Lottie.asset('asset/lottie/fan.json'),
            Image.asset('asset/images/logo2.png'), // Correct path to your image
            const SizedBox(height: 20), // Space between image and text
            const Text(
              'All Pass!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
