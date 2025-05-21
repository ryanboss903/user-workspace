import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks - HustleHub'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _taskCard('Repair Bicycle', 'Get your bike fixed quickly'),
            _taskCard('Water Refilling', 'Book water refilling services'),
            _taskCard('Househelp', 'Find trusted househelp'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to post new task screen
              },
              child: Text('Post a New Task'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskCard(String title, String description) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Navigate to task details or bidding screen
        },
      ),
    );
  }
}
