import 'package:flutter/material.dart';
import 'package:flutter_topics/Data/passenger_model.dart';
import 'package:flutter_topics/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}
