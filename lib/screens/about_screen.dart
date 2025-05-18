import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showDetailSheet(BuildContext context, String title, List<String> contentList) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...contentList.map((item) => ListTile(
              leading: const Icon(Icons.arrow_right),
              title: Text(item),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nia Sur',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text('Flutter Developer'),
              const SizedBox(height: 24),
              const Text(
                'Saya adalah pengembang Flutter pemula yang sedang belajar '
                    'membangun aplikasi mobile.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // BUTTONS SECTION
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _showDetailSheet(context, 'Tools', [
                        'Flutter & Dart',
                        'VS Code & Android Studio',
                        'Git & GitHub',
                        'Firebase',
                        'Postman',
                      ]);
                    },
                    icon: const Icon(Icons.build),
                    label: const Text('Tools'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showDetailSheet(context, 'Works', [
                        'Part Time',
                        'Desain Grafis',
                        'Organisai & Kepanitiaan',
                      ]);
                    },
                    icon: const Icon(Icons.work),
                    label: const Text('Works'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showDetailSheet(context, 'Experiences', [
                        'Kampus Merdeka (2024-sekarang)',
                        'MSIB (2024)',
                        'Hackathon Flutter Community (2023)',
                      ]);
                    },
                    icon: const Icon(Icons.timeline),
                    label: const Text('Experiences'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showDetailSheet(context, 'Education', [
                        'S1 Sistem Informasi - UNIPI (2022 - sekarang)',
                        'Belajar Flutter di Dicoding & YouTube',
                        'Kursus UI/UX di Coursera',
                      ]);
                    },
                    icon: const Icon(Icons.school),
                    label: const Text('Education'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // SOCIAL MEDIA SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: () => _launchUrl('https://github.com/niasur'),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue),
                    onPressed: () => _launchUrl('https://www.linkedin.com/in/nia-surniati-967259213'),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
                    onPressed: () => _launchUrl('https://www.instagram.com/snsr_28'),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}