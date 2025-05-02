import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            SizedBox(height: 8),
            Text("Foto Profil"), // ini ditaruh di luar CircleAvatar
            SizedBox(height: 10),
            Text(
              "Nia Sur",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Flutter Developer"),
          ],
        ),
      ),
    );
  }
}
