import 'package:flutter/material.dart';
import '/screens/splash_screen.dart';

void main() {
  runApp(const MaterialApp(
  home: SplashScreen()


  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_splash2.png"),
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
              style: TextStyle(color: Color.fromARGB(255, 252, 252, 252)),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: const SplashScreen(),
        ),
      ),
    );
  }
}
