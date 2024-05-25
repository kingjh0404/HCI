import 'package:flutter/material.dart';
import 'package:mbtiology/student/profile2.dart';
// import 'profile.dart'; // profile.dart 파일을 임포트합니다.



class PersonalInfoPage2 extends StatefulWidget {
  @override
  _PersonalInfoPage2State createState() => _PersonalInfoPage2State();
}

class _PersonalInfoPage2State extends State<PersonalInfoPage2> {
  final _formKey = GlobalKey<FormState>();
  String _adminNumber = '';
  String _name = '';
  // String _
  String _dorm = 'Papyrus hall';
  final List<String> _dorms = [
    'Papyrus hall',
    'International hall',
    'Rodem hall',
    'Bethel hall',
    'Vision hall',
    'Grace hall',
    'Creation hall',
    'HaYongJo hall',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
          children: [
    //       IconButton(
    //       icon: Icon(Icons.arrow_back),
    //   onPressed: () {
    //     Navigator.pop(context); // 뒤로 가기 아이콘을 눌렀을 때 이전 페이지로 이동합니다.
    //   },
    // ),
     SizedBox(width: 45),
    Text('Personal information'),
    ],
    ),
        backgroundColor: Color(0xFFD9D9D9),
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Student number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter student number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _adminNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _dorm,
                onChanged: (String? newValue) {
                  setState(() {
                    _dorm = newValue!;
                  });
                },
                items: _dorms.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Select dorm'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'room number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter room number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _adminNumber = value!;
                },
              ),
              SizedBox(height: 330.0),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Navigate to ProfilePage and pass adminNumber and name
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            adminNumber: _adminNumber,
                            name: _name,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xFFB4B4B4), // 텍스트 색상을 검정색으로 설정합니다.
                  ),
                  child: Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
