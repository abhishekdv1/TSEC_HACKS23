import 'package:barter_app/home_screen.dart';
import 'package:barter_app/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.deepPurple[100],
          primaryColor: Colors.purple),
      home: const LoginScreen(),
      // home: const HomeScreen(),
    );
  }
}
