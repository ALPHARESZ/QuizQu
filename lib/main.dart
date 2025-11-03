import 'package:flutter/material.dart';

import 'config/routes.dart';

void main() {
  runApp(const QuizQuApp());
}

class QuizQuApp extends StatelessWidget {
  const QuizQuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QuizQu',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B56E0)),
      ),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
