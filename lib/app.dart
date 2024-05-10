// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'package:mbtiology/1_home_screen/home_screen.dart';
import '4_login_screen/login.dart';
import '4_login_screen/login_info.dart';
import '4_login_screen/accept_terms.dart';
import '4_login_screen/privacy_policy.dart';
import '4_login_screen/choose.dart';

class HCIApp extends StatelessWidget {
  const HCIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HCI',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/term':(BuildContext context) => const TermsScreen(),
        '/termsOfUse': (context) => const TermsOfUseScreen(),
        '/privacyPolicy': (context) => const PrivacyPolicyScreen(),
        '/choose':(BuildContext context) => const ChooseRoleScreen(),

      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}