import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/profile_card.dart';
import '../screens/projects_screen.dart';
import '../screens/about_screen.dart';

class HomeScreen extends StatelessWidget {
  // Ganti URL dengan link GitHub kamu
  final Uri githubUrl = Uri.parse('https://www.linkedin.com/in/nia-surniati-967259213');

  Future<void> _launchContact() async {
    if (!await launchUrl(
      githubUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Portfolio")),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileCard(),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("View Projects"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsScreen()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text("About Me"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Trying to open GitHub...');
                    _launchContact(); // Pastikan method ini ada di kelas ini
                  },
                  child: Text("Contact Us"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}