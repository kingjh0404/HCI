import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secretary'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share Test 기능 구현
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),

            SizedBox(height: 32.0),
            SwitchListTile(
              title: Text(
                'General Rules & Counseling Area',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: isGeneralRulesOn,
              onChanged: (value) {
                setState(() {
                  isGeneralRulesOn = value;
                });
              },
            ),

            SwitchListTile(
              title: Text('Introduction of Secretary and Floor Manager'),
              value: isSecretaryOn,
              onChanged: (value) {
                setState(() {
                  isSecretaryOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Phone Number Advertisement'),
              value: isPhoneNumberOn,
              onChanged: (value) {
                setState(() {
                  isPhoneNumberOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('ANTI-PASS'),
              value: isAntiPassOn,
              onChanged: (value) {
                setState(() {
                  isAntiPassOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Mandatory at least once a session'),
              value: isMandatoryOn,
              onChanged: (value) {
                setState(() {
                  isMandatoryOn = value;
                });
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text(
                'Occupancy and Departure & Store and Penalty System',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: isOccupancyRulesOn,
              onChanged: (value) {
                setState(() {
                  isOccupancyRulesOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Occupancy'),
              value: isOccupancyOn,
              onChanged: (value) {
                setState(() {
                  isOccupancyOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Eviction'),
              value: isEvictionOn,
              onChanged: (value) {
                setState(() {
                  isEvictionOn = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Smoking related'),
              value: isSmokingRelatedOn,
              onChanged: (value) {
                setState(() {
                  isSmokingRelatedOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
