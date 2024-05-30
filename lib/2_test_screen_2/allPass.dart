// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mbtiology/student/start2.dart';
//
// class AllPass extends StatefulWidget {
//   const AllPass({Key? key}) : super(key: key);
//
//   @override
//   _AllPassState createState() => _AllPassState();
// }
//
// class _AllPassState extends State<AllPass> {
//   String name = '';
//   String adminNumber = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchStudentInfo();
//   }
//
//   Future<void> _fetchStudentInfo() async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
//       await FirebaseFirestore.instance
//           .collection('students_personinfo')
//           .doc('document_id') // Replace with the actual document ID
//           .get();
//
//       if (documentSnapshot.exists) {
//         setState(() {
//           name = documentSnapshot.data()?['name'] ?? '';
//           adminNumber = documentSnapshot.data()?['adminNumber'] ?? '';
//         });
//       }
//     } catch (e) {
//       print("Error fetching student info: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Result'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset('asset/lottie/fan.json'),
//             Image.asset('asset/images/logo2.png'),
//             const SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => StartPage(
//                       name: name,
//                       adminNumber: adminNumber,
//                     ),
//                   ),
//                 );
//               },
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//               child: const Text(
//                 'All Pass!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );x
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mbtiology/student/start2.dart';

class AllPass extends StatefulWidget {
  const AllPass({Key? key, required this.adminNumber}) : super(key: key);
  final String adminNumber;

  @override
  _AllPassState createState() => _AllPassState();
}

class _AllPassState extends State<AllPass> {
  String name = '';
  String adminNumber = '';

  @override
  void initState() {
    super.initState();
    _fetchStudentInfo();
  }

  Future<void> _fetchStudentInfo() async {
    try {
      // adminNumber를 기반으로 Firestore에서 정보 조회
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('students_personinfo')
          .where('adminNumber', isEqualTo: widget.adminNumber) // widget에서 adminNumber를 가져옴
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot = snapshot.docs.first;
        setState(() {
          name = documentSnapshot.data()?['name'] ?? '';
          adminNumber = documentSnapshot.data()?['adminNumber'] ?? '';
        });
      }
    } catch (e) {
      print("Error fetching student info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('asset/lottie/fan.json'),
            Image.asset('asset/images/logo2.png'),
            const SizedBox(height: 20),
            TextButton(
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
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'All Pass!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
