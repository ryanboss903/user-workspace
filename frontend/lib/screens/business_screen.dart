import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Businesses - HustleHub'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _businessCard('Salon Deluxe', 'Nairobi', 'Open'),
          _businessCard('Duka Express', 'Mombasa', 'Closed'),
          _businessCard('Vibanda Fresh', 'Kisumu', 'Open'),
        ],
      ),
    );
  }

  Widget _businessCard(String name, String location, String status) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$location - Status: $status'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Navigate to business details and booking/order screen
        },
      ),
    );
  }
}
