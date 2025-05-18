import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';

import 'screens/home_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/movies_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/mood_screen.dart';
import 'screens/ecommerce_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // 👈 Tambah ini
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Project App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: themeProvider.themeMode, // 🔥 Gunakan mode dari provider
      home: HomeScreen(),
      routes: {
        '/todo': (context) => const TodoScreen(),
        '/contact': (context) => ContactsScreen(),
        '/weather': (context) => WeatherScreen(),
        '/movie': (context) => MoviesScreen(),
        '/chat': (context) => ChatScreen(),
        '/moodify': (context) => MoodScreen(),
        '/ecommerce': (context) => EcommerceScreen(),
      },
    );
  }
}