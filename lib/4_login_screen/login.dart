

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  // Save user information to Firestore
  User? user = userCredential.user;
  if (user != null) {
    final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    try {
      await userDoc.set({
        'uid': user.uid,
        'displayName': user.displayName,
        'email': user.email,
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error saving user to Firestore: $e');
    }
  }

  return userCredential;
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
                  backgroundColor: const Color(0xFFD9D9D9),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  elevation: 0,
                ),
                onPressed: () async {
                  try {
                    await signInWithGoogle();
                    Navigator.pushNamed(context, '/term');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to sign in: $e')),
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("asset/images/go.png", width: 30, height: 30),
                    const SizedBox(width: 10),
                    const Text(
                      'Start with Google Account',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
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
