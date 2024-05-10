import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],  // Set the background color to grey
      backgroundColor: Color(0xFFD9D9D9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'RuleMate',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9), // Set the background color to light gray
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50), // Increase button size by adding more padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // Slight rounded corners
                    side: const BorderSide(color: Colors.black, width: 1), // Black border with a width of 1
                  ),
                  elevation: 0, // Optional: remove shadow if not needed
                ),
                onPressed: () async {
                  await signInWithGoogle();
                  Navigator.pushNamed(context, '/term');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,  // Use the minimum space that content needs
                  children: [
                    Image.asset("asset/images/go.png", width: 30, height: 30),  // Image icon
                    const SizedBox(width: 10),  // Space between the image and text
                    const Text('Start with Google Account',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
