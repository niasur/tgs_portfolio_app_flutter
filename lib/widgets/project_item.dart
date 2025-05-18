import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../screens/todo_screen.dart';
import '../screens/weather_screen.dart';
import '../screens/movies_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/mood_screen.dart';
import '../screens/ecommerce_screen.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem({Key? key, required this.project}) : super(key: key);

  void _launchProjectUrl(String? url) async {
    if (url == null || url.isEmpty) {
      print('No URL provided.');
      return;
    }
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          if (project.title == "Portfolio Website" && project.url != null) {
            _launchProjectUrl(project.url);
          } else if (project.title == "To-Do List App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TodoScreen()),
            );
          } else if (project.title == "Weather App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeatherScreen()),
            );
          } else if (project.title == "Movies App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoviesScreen()),
            );
          } else if (project.title == "Chat App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          } else if (project.title == "Moodify App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoodScreen()),
            );
          } else if (project.title == "E-commerce App") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EcommerceScreen()),
            );
          }
        },
        leading: Image.asset(project.imageUrl, width: 50, height: 50),
        title: Text(project.title),
        subtitle: Text(project.description),
      ),
    );
  }
}