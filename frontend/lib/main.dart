import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/map_screen.dart';
import 'screens/task_screen.dart';
import 'screens/business_screen.dart';
import 'screens/emergency_screen.dart';

void main() {
  runApp(HustleHubApp());
}

class HustleHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HustleHub',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/auth': (context) => AuthScreen(),
        '/map': (context) => MapScreen(),
        '/task': (context) => TaskScreen(),
        '/business': (context) => BusinessScreen(),
        '/emergency': (context) => EmergencyScreen(),
      },
    );
  }
}
