import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool acceptAll = false;
  bool acceptTerms = false;
  bool acceptPrivacy = false;

  void _toggleAll(bool value) {
    setState(() {
      acceptAll = value;
      acceptTerms = value;
      acceptPrivacy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9), // Set the background color to light gray
      appBar: AppBar(
        title: const Text('Accept Terms'),
        backgroundColor: const Color(0xFFD9D9D9), // Set AppBar background color
        elevation: 0, // Remove shadow for a seamless look
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          CheckboxListTile(
            title: const Text('Accept full terms'),
            value: acceptAll,
            onChanged: (bool? value) {
              _toggleAll(value ?? false);
            },
          ),
          CheckboxListTile(
            title: const Text('Sign up and agree to the Terms of Use (required)'),
            value: acceptTerms,
            onChanged: (bool? value) {
              setState(() {
                acceptTerms = value!;
                acceptAll = acceptTerms && acceptPrivacy;
              });
            },
            secondary: GestureDetector(
              child: const Icon(Icons.description),
              onTap: () => Navigator.pushNamed(context, '/termsOfUse'),
            ),
          ),
          CheckboxListTile(
            title: const Text('Consent to the collection and use of personal information (required)'),
            value: acceptPrivacy,
            onChanged: (bool? value) {
              setState(() {
                acceptPrivacy = value!;
                acceptAll = acceptTerms && acceptPrivacy;
              });
            },
            secondary: GestureDetector(
              child: const Icon(Icons.privacy_tip),
              onTap: () => Navigator.pushNamed(context, '/privacyPolicy'),
            ),
          ),
          const SizedBox(height: 10),  // Reduced space before the button
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Reduced padding to move the button up
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Set button color to black
            foregroundColor: Colors.white, // Text color to white
          ),
          onPressed: () {
            if (acceptTerms && acceptPrivacy) {
              Navigator.pushNamed(context, '/choose');
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: const Text("You must agree to all terms to continue."),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
