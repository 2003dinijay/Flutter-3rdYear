import 'package:flutter/material.dart';
import 'package:my_first_app/pages/profile-page.dart';
import 'pages/profile-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfilePage(), // Set ProfilePage as the home page
    );
  }
}
