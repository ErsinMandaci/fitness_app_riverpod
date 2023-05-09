import 'package:fitness_app/app_theme.dart';
import 'package:fitness_app/feature/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) async {
  runApp(
    const ProviderScope(
      child: FitnessApp(),
    ),
  );
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData(context).theme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
