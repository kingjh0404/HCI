import 'package:flutter/material.dart';
import 'check.dart'; // 여기서 CheckPage는 별도로 정의되어 있는 다른 페이지를 의미합니다.

class ModifyPage extends StatefulWidget {
  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  bool isGeneralRulesOn = false;
  bool isFloor = false;
  bool isPhoneNumberOn = false;
  bool isSecretaryOn = true;
  bool isAntiPassOn = true;
  bool isMandatoryOn = false;
  bool isOccupancyRulesOn = true;
  bool isOccupancyOn = false;
  bool isEvictionOn = false;
  bool isSmokingRelatedOn = false;
  bool isAlcoholOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AppBar(
        title: Text('Modify Settings'),
        backgroundColor: Color(0xFFD9D9D9),
        actions: [
          IconButton(
            icon: Icon(Icons.add_task_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckPage()), // CheckPage로 이동
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // SingleChildScrollView를 추가하여 스크롤 가능하게 함
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Center(
                child: Image.asset('asset/images/logo2.png', width: 373, height: 200),
              ),
              SizedBox(height: 32.0),
              SwitchListTile(
                title: Text(
                  'General Rules & Counseling Area',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                value: isGeneralRulesOn,
                onChanged: (bool value) {
                  setState(() {
                    isGeneralRulesOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Introduction of Secretary and Floor Manager',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isSecretaryOn,
                onChanged: (bool value) {
                  setState(() {
                    isSecretaryOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Phone Number Advertisement',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isPhoneNumberOn,
                onChanged: (bool value) {
                  setState(() {
                    isPhoneNumberOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('ANTI-PASS',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isAntiPassOn,
                onChanged: (bool value) {
                  setState(() {
                    isAntiPassOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Mandatory at least once a session',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isMandatoryOn,
                onChanged: (bool value) {
                  setState(() {
                    isMandatoryOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              Divider(),
              SwitchListTile(
                title: Text(
                  'Occupancy and Departure & Store and Penalty System',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                value: isOccupancyRulesOn,
                onChanged: (bool value) {
                  setState(() {
                    isOccupancyRulesOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Occupancy',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isOccupancyOn,
                onChanged: (bool value) {
                  setState(() {
                    isOccupancyOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Eviction',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isEvictionOn,
                onChanged: (bool value) {
                  setState(() {
                    isEvictionOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Smoking related',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isSmokingRelatedOn,
                onChanged: (bool value) {
                  setState(() {
                    isSmokingRelatedOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
              SwitchListTile(
                title: Text('Alcohol entry or consumption',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                value: isAlcoholOn,
                onChanged: (bool value) {
                  setState(() {
                    isAlcoholOn = value;
                  });
                },
                activeColor: Colors.white, // 스위치 원의 색상
                activeTrackColor: Colors.yellow, // 스위치 배경의 색상
              ),
            ],
          ),
        ),
      ),
    );
  }
}
