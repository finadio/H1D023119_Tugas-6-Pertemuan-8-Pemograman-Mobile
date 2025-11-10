// main.dart
import 'package:flutter/material.dart';
import 'ui/form_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormDataScreen(),
    );
  }
}
