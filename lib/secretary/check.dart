// // import 'package:flutter/material.dart';
// //
// // class CheckPage extends StatefulWidget {
// //   @override
// //   _CheckPageState createState() => _CheckPageState();
// // }
// //
// // class _CheckPageState extends State<CheckPage> {
// //   // 모든 주민의 체크 상태를 `false`로 초기화
// //   final List<Map<String, dynamic>> residents = [
// //     {'name': '[Bethel] 101-A Minho Kim', 'checked': false},
// //     {'name': '[Bethel] 101-B Jaehyun Lee', 'checked': false},
// //     {'name': '[Bethel] 101-C Junseok Park', 'checked': false},
// //     {'name': '[Bethel] 101-D Seungwoo Choi', 'checked': false},
// //     {'name': '[Bethel] 102-A Taehyun Kang', 'checked': false},
// //     {'name': '[Bethel] 102-B Hyunwoo Yoo', 'checked': false},
// //     {'name': '[Bethel] 102-C Junseok Park', 'checked': false},
// //     {'name': '[Bethel] 102-D Seungwoo Choi', 'checked': false},
// //     {'name': '[Bethel] 103-A Taehyun Kang', 'checked': false},
// //     {'name': '[Bethel] 103-B Hyunwoo Yoo', 'checked': false},
// //     {'name': '[Bethel] 103-C Minkyoung Kim', 'checked': false},
// //     {'name': '[Bethel] 103-D Jisoo Kim', 'checked': false},
// //     {'name': '[Bethel] 104-A JeongHui Kang', 'checked': false},
// //     {'name': '[Bethel] 104-B Sarang Park', 'checked': false},
// //     {'name': '[Bethel] 104-C yem Kim', 'checked': false},
// //     {'name': '[Bethel] 104-D Hajin Yon', 'checked': false},
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFFD9D9D9),
// //       appBar: AppBar(
// //         title: Text('Completion Confirmation'),
// //         backgroundColor: Color(0xFFD9D9D9),
// //       ),
// //       body: ListView.builder(
// //         itemCount: residents.length,
// //         itemBuilder: (context, index) {
// //           final resident = residents[index];
// //           return CheckboxListTile(
// //             title: Text(resident['name']),
// //             value: resident['checked'],
// //             onChanged: (value) {
// //               setState(() {
// //                 // 체크 상태를 사용자가 변경할 때마다 업데이트합니다.
// //                 residents[index]['checked'] = value;
// //               });
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class CheckPage extends StatefulWidget {
//   @override
//   _CheckPageState createState() => _CheckPageState();
// }

// class _CheckPageState extends State<CheckPage> {
//   // 모든 주민의 체크 상태를 `false`로 초기화
//   final List<Map<String, dynamic>> residents = [
//     {'name': '[Bethel] 101-A Minho Kim', 'checked': true},
//     {'name': '[Bethel] 101-B Jaehyun Lee', 'checked': false},
//     {'name': '[Bethel] 101-C Junseok Park', 'checked': false},
//     {'name': '[Bethel] 101-D Seungwoo Choi', 'checked': true},
//     {'name': '[Bethel] 102-A Taehyun Kang', 'checked': false},
//     {'name': '[Bethel] 102-B Hyunwoo Yoo', 'checked': true},
//     {'name': '[Bethel] 102-C Junseok Park', 'checked': false},
//     {'name': '[Bethel] 102-D Seungwoo Choi', 'checked': false},
//     {'name': '[Bethel] 103-A Taehyun Kang', 'checked': false},
//     {'name': '[Bethel] 103-B Hyunwoo Yoo', 'checked': true},
//     {'name': '[Bethel] 103-C Minkyoung Kim', 'checked': true},
//     {'name': '[Bethel] 103-D Jisoo Kim', 'checked': false},
//     {'name': '[Bethel] 104-A JeongHui Kang', 'checked': false},
//     {'name': '[Bethel] 104-B Sarang Park', 'checked': false},
//     {'name': '[Bethel] 104-C yem Kim', 'checked': false},
//     {'name': '[Bethel] 104-D Hajin Yon', 'checked': false},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFD9D9D9),
//       appBar: AppBar(
//         title: Text('Completion Confirmation'),
//         backgroundColor: Color(0xFFD9D9D9),
//       ),
//       body: ListView.builder(
//         itemCount: residents.length,
//         itemBuilder: (context, index) {
//           final resident = residents[index];
//           return CheckboxListTile(
//             title: Text(resident['name']),
//             value: resident['checked'],
//             onChanged: (value) {
//               setState(() {
//                 // 체크 상태를 사용자가 변경할 때마다 업데이트합니다.
//                 residents[index]['checked'] = value;
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final List<Map<String, dynamic>> residents = [];
  final List<DocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    _fetchResidents();
  }

  Future<void> _fetchResidents() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('students_personinfo').get();

      final List<Map<String, dynamic>> fetchedResidents = querySnapshot.docs.map((doc) {
        return {
          'name': doc.data()['name'] ?? '',
          'dorm': doc.data()['dorm'] ?? '',
          'roomNumbe': doc.data()['roomNumber'] ?? '',
          'pass': doc.data()['pass'] ?? false,
        };
      }).toList();

      setState(() {
        residents.addAll(fetchedResidents);
        documents.addAll(querySnapshot.docs); // Store DocumentSnapshot objects
      });
    } catch (e) {
      print("Error fetching residents: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        title: const Text('Completion Confirmation'),
        backgroundColor: const Color(0xFFD9D9D9),
      ),
      body: residents.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: residents.length,
        itemBuilder: (context, index) {
          final resident = residents[index];
          return CheckboxListTile(
            // title: Text(resident['name']),
            title: Text('[${resident['dorm']}] ${resident['roomNumbe']} ${resident['name']}'),
            //value: resident['checked'],
            value: resident['pass'],
            onChanged: (value) {
              setState(() {
                residents[index]['pass'] = value;
                // Update Firestore here to reflect the new state
                FirebaseFirestore.instance
                    .collection('students_personinfo')
                    .doc(documents[index].id) // Use DocumentSnapshot id to update
                    .update({'pass': value});
              });
            },
          );
        },
      ),
    );
  }
}
