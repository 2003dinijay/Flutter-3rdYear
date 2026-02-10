import 'package:flutter/material.dart';

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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Divider(thickness: 2, color: Colors.grey[300]),

            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile.jpeg'),
                // child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Dinithi Nanayakkara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              'dinijayo@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            SizedBox(height: 30),

            _buildInfoCard(Icons.phone, 'Phone', '+94 77 123 4567'),
            _buildInfoCard(Icons.cake, 'Birthday', 'Aug 08, 2003'),
            _buildInfoCard(Icons.location_on, 'Location', 'Colombo, Sri Lanka'),
            _buildInfoCard(Icons.work, 'Occupation', 'Software Developer'),

            SizedBox(height: 20),

            // Action buttons
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      print('Edit Profile clicked');
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profile'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      print('Share clicked');
                    },
                    icon: Icon(Icons.share),
                    label: Text('Share'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
