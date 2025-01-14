import 'package:flutter/material.dart';
import '/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("/images/bg_splash.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.transparent),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Before & After App',
            ),
            backgroundColor: Colors.transparent,
          ),
          body: const SplashScreen(),
        ),
      ),
    );
  }
}
