// import 'package:flutter/material.dart';


// class ChooseRoleScreen extends StatelessWidget {
//   const ChooseRoleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("Choose who you are"),
//       // ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Choose who you are",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30), // Space between text and cards
//             GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               padding: const EdgeInsets.all(20),
//               mainAxisSpacing: 20, // Vertical spacing
//               crossAxisSpacing: 20, // Horizontal spacing
//               children: <Widget>[
//                 const RoleCard(role: "student", iconData: Icons.school),
//                 const RoleCard(role: "secretary", iconData: Icons.work),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RoleCard extends StatelessWidget {
//   final String role;
//   final IconData iconData;

//   const RoleCard({Key? key, required this.role, required this.iconData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Handle the tap here. For example, navigate to a different screen or perform other actions based on 'role'
//         print('Selected role: $role');
//       },
//       child: Card(
//         child: Container(
//           width: 100,
//           height: 100,
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(iconData, size: 40),
//               const SizedBox(height: 8),
//               Text(role),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mbtiology/secretary/person_information.dart';
import 'package:mbtiology/student/person_information2.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose who you are",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30), // Space between text and cards
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 20, // Vertical spacing
              crossAxisSpacing: 20, // Horizontal spacing
              children: <Widget>[
               RoleCard(
              role: "student",
  iconData: Icons.school,
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalInfoPage2()),
    );
  },
),

                RoleCard(
  role: "secretary",
  iconData: Icons.school,
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalInfoPage()),
    );
  },
)

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String role;
  final IconData iconData;
  final VoidCallback onPressed;  // 콜백 함수를 추가합니다.

  const RoleCard({
    Key? key,
    required this.role,
    required this.iconData,
    required this.onPressed,  // 생성자를 통해 함수를 받습니다.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,  // onTap 이벤트에 함수를 연결합니다.
      child: Card(
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 40),
              SizedBox(height: 8),
              Text(role),
            ],
          ),
        ),
      ),
    );
  }
}
