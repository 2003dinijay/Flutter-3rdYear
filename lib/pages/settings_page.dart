import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Settings Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page or perform an action
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
