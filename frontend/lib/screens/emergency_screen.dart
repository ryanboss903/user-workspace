import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services - HustleHub'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Priority Tasks and Emergency Services',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.red.shade100,
              child: ListTile(
                leading: Icon(Icons.warning, color: Colors.red),
                title: Text('Request Priority Task'),
                subtitle: Text('Small fee applies for priority handling'),
                onTap: () {
                  // TODO: Implement priority task request
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.orange.shade100,
              child: ListTile(
                leading: Icon(Icons.local_hospital, color: Colors.orange),
                title: Text('Emergency Help'),
                subtitle: Text('Contact emergency agents nearby'),
                onTap: () {
                  // TODO: Implement emergency contact feature
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
