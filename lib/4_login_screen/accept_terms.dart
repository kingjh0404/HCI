import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9), // Set AppBar background color
      appBar: AppBar(
        title: const Text('Accept Terms'),
        backgroundColor: const Color(0xFFD9D9D9), // Set AppBar background color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 12), // Default text style
            children: <TextSpan>[
              TextSpan(text: 'Rule 1: General Rules\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. The "Rule Mate" app (the "App") is designed to help users familiarize themselves with the rules of the dormitory.\n 2.These Terms of Use establish the rights, obligations, and responsibilities between the App users (hereinafter referred to as "Users") and the App operators.\n 3.By using the App, you are deemed to have agreed to these Terms of Use.\n\n'),
              
              TextSpan(text: 'Rule 2: Provision of the Services\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. The app provides users with the following services:\n  a.Training guidance and management\n  b.Whether the user is trained or not\n  c.Setting up and administering the Code of Conduct for each dormitory.\n 2.The App may add, change, or discontinue any of the Services, and may do so with your prior notice or consent.\n\n'),
              
              TextSpan(text: 'Rule 3: your Obligations\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. Users must comply with the following when using the App:\n  a.Provide your real name and accurate information.\n  b.Do not use the App\'s services fraudulently or collect, use, or disclose any third party\'s personal information without authorization.\n  c.Do not take any action that interferes with the operation of the App.\n- You must keep your account information secure. The App is not responsible for any damage caused by your negligence or password breach.\n\n'),
              
              TextSpan(text: 'Rule 4: Personal Information Protection\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. The App adheres to a privacy policy to manage users\' personal information. Details regarding the collection, use, and protection of personal information are explained in the privacy policy.\n\n'),
              
              TextSpan(text: 'Rule 5: Limitation of Liability\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. The App shall not be liable for any damages incurred by users through transactions or interactions with third parties. The App shall not be liable for interruptions or damages in service provision due to unavoidable reasons such as force majeure, system failure, or service suspension.\n\n'),
              
              TextSpan(text: 'Rule 6: Ownership Rights\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. The App holds the intellectual property rights for software, design, logos, etc., required for the service provision. Users may only use the services provided by the App for personal purposes. Commercial use, resale, transfer, or modification of the services is prohibited.\n\n'),
              
              TextSpan(text: 'Rule 7: Termination of Service Agreement\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. Users may terminate the service agreement and discontinue App usage at any time. The App reserves the right to restrict user service usage or terminate the service agreement if users violate these terms of use or disrupt App operation.\n\n'),
              
              TextSpan(text: 'Rule 8: Governing Law and Jurisdiction\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '1. These terms of use shall be interpreted and applied in accordance with the laws of the Republic of Korea, and disputes between users shall be under the jurisdiction of Korean courts.'),
            ],
          ),
        ),
      ),
    );
  }
}