import 'dart:async';
import 'package:flutter/material.dart';

import '/screens/loginscreen.dart';

// void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug tag
      title: 'Before & After App',
      home: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("./assets/images/bg_animate.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "./assets/images/logoanimate.gif",
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.6,
                            ),
                          ),
                          // Removed ElevatedButton
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center, // Move the image to the center
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.only(bottom: 20), // Add bottom padding
                    child: Image.asset(
                      "./assets/images/maglev.png",
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "Ver1.0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({
    super.key,
    this.text,
    this.image,
  });

  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text(
          "MAGLEV EVENTS",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFFFF7643),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.network(
          widget.image!,
          fit: BoxFit.contain,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}