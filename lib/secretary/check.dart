import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  // 모든 주민의 체크 상태를 `false`로 초기화
  final List<Map<String, dynamic>> residents = [
    {'name': '[Bethel] 101-A Minho Kim', 'checked': false},
    {'name': '[Bethel] 101-B Jaehyun Lee', 'checked': false},
    {'name': '[Bethel] 101-C Junseok Park', 'checked': false},
    {'name': '[Bethel] 101-D Seungwoo Choi', 'checked': false},
    {'name': '[Bethel] 102-A Taehyun Kang', 'checked': false},
    {'name': '[Bethel] 102-B Hyunwoo Yoo', 'checked': false},
    {'name': '[Bethel] 102-C Junseok Park', 'checked': false},
    {'name': '[Bethel] 102-D Seungwoo Choi', 'checked': false},
    {'name': '[Bethel] 103-A Taehyun Kang', 'checked': false},
    {'name': '[Bethel] 103-B Hyunwoo Yoo', 'checked': false},
    {'name': '[Bethel] 103-C Minkyoung Kim', 'checked': false},
    {'name': '[Bethel] 103-D Jisoo Kim', 'checked': false},
    {'name': '[Bethel] 104-A JeongHui Kang', 'checked': false},
    {'name': '[Bethel] 104-B Sarang Park', 'checked': false},
    {'name': '[Bethel] 104-C yem Kim', 'checked': false},
    {'name': '[Bethel] 104-D Hajin Yon', 'checked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AppBar(
        title: Text('Completion Confirmation'),
        backgroundColor: Color(0xFFD9D9D9),
      ),
      body: ListView.builder(
        itemCount: residents.length,
        itemBuilder: (context, index) {
          final resident = residents[index];
          return CheckboxListTile(
            title: Text(resident['name']),
            value: resident['checked'],
            onChanged: (value) {
              setState(() {
                // 체크 상태를 사용자가 변경할 때마다 업데이트합니다.
                residents[index]['checked'] = value;
              });
            },
          );
        },
      ),
    );
  }
}
