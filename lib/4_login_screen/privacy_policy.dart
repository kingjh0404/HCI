import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 12), // Default text style
            children: <TextSpan>[
              TextSpan(text: 'Article 1: Purpose of Processing Personal Data\n'),
              TextSpan(text: 'This application is used to help guide the residence hall discipline training. The main purposes of processing personal data are:\n'
                            '- Identification and authentication of the user\n'
                            '- Providing you with a personalised service\n'
                            '- Improve and expand our services\n'
                            '- Responding to your inquiries and requests\n\n'),
              
              TextSpan(text: 'Article 2: Types of Personal Information We Collect\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: '"Rule mate" The app may collect the following personal information:\n'
                            '- Username: Collected to identify you and provide you with a personalized experience within the App.\n'
                            '- Email address: Collected for account management and notification services.\n'
                            '- Password: Encrypted and stored to keep your account secure.\n'
                            '- Profile picture: Displayed on your profile if you choose.\n\n'),
              
              TextSpan(text: 'Article 3: How We Use Your Personal Information\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: 'The Rule mate App uses personal information for the following purposes:\n'
                            '- User identification and authentication: To identify you and allow you to access the App Services.\n'
                            '- Provide personalized services: to provide you with content and features tailored to your preferences and interests.\n'
                            '- Improve and expand our services: analyze your feedback and app usage patterns to improve our services and develop new features.\n'
                            '- Respond to your inquiries and requests: We may use your personal information to respond to your inquiries or fulfill your requests.\n\n'
                            'Retention and deletion of personal information The app retains your personal information for the duration of your use of the service. '
                            'If you terminate your use of the App or request the deletion of your personal information, it will be deleted or destroyed immediately.\n\n'
                            'Provision and Sharing of Personal Information The app does not share your personal information with third parties, except in cases where it is required by law or with your consent.\n\n'
                            'Security of your personal information The app complies with applicable laws and security procedures to protect your personal information. '
                            'We transmit your personal information through encrypted communication channels and use security systems to prevent access to and unauthorized use of your personal information.\n\n'
                            'Your rights regarding your personal information You have certain rights regarding your personal information. You can request access, correction, and deletion of your personal information, and you can withdraw your consent to the processing of your personal information. '
                            'To exercise any of these rights, please use the app\'s privacy contact channel.\n\n'
                            'Changes to the Privacy Policy The app reserves the right to revise this Privacy Policy. If we do, we will notify you via an in-app notification and make the changes publicly available.\n\n'
                            'The above personal information processing policy is intended to explain and guide how to use personal information collected by daily apps. Users can carefully read this personal information processing policy before using the app service and decide whether to agree.'),
            ],
          ),
        ),
      ),
    );
  }
}
