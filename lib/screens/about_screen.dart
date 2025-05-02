import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final Uri contactUrl = Uri.parse('https://yourwebsite.com/contact'); // Ganti sesuai link kamu

  Future<void> _launchContact() async {
    if (!await launchUrl(contactUrl)) {
      throw 'Could not launch $contactUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Me')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Nia Sur',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Flutter Developer'),
            SizedBox(height: 24),
            Text(
              'Saya adalah pengembang Flutter pemula yang sedang belajar '
                  'membangun aplikasi mobile.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
