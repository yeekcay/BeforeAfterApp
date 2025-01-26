import 'package:flutter/material.dart';

import '/screens/loginscreen.dart';
//import 'package:shop_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_animate.gif"), fit: BoxFit.cover)),
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body:
       Column(
        mainAxisSize: MainAxisSize.max,
        children: [
      //     Container(
            
      //       decoration: new BoxDecoration(
      // image: new DecorationImage(
      //   image: new AssetImage("assets/images/bg_splash.jpg"),
      //   fit: BoxFit.fill,
          
      //     ),
      //       ),
      //     ),
          // Expanded(
            

          //  child: Image.asset("assets/images/logoanimate.gif",
          //  width: 200,
          //  alignment: Alignment.topRight,
           
           
          //  ),
        // fit: BoxFit.fill,
        Container(
            child:  Image.asset("assets/images/logoanimate.gif",
              // Can add other properties on how you would like the anim to display

              fit: BoxFit.contain,
              width: 700,
              height: 700,
            ),
          ),

 ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );

           },
          style: ElevatedButton.styleFrom(
           backgroundColor:Colors.white, // set the background color
           foregroundColor: Colors.black,
          //  Color disabledForegroundColor,
           shadowColor: Colors.grey,
          //  double elevation,
          //  TextStyle textStyle,
          //  EdgeInsetsGeometry padding,
         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
),
          child: Text('Sign in/Sign up'),

          //  BorderSide side,
          //  OutlinedBorder shape,
          //  MouseCursor enabledMouseCursor,
          //  MouseCursor disabledMouseCursor,
          //  VisualDensity visualDensity,
          //  MaterialTapTargetSize tapTargetSize,
          //  Duration animationDuration,
          //  bool enableFeedback
     ),
         
      Container(
        alignment: Alignment.bottomRight,
         margin:
        // const  EdgeInsets.symmetric(vertical: 10,),
        const EdgeInsets.only(
      // left: 20,
       top: 10,
       right: 10,
      // bottom: 660,
    ),
            child:  Image.asset("assets/images/maglev.png",
              // Can add other properties on how you would like the anim to display

              fit: BoxFit.contain,
              width: 110,
              height: 110,
            ),
          ),


    // TextButton.icon(
    //           onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => const CustomListItemApp()),
    //           );
    //         },
    //           icon: const Text("Sign Up/Sign In",
    //           style: TextStyle(
    //            color: Colors.white,
    //             fontSize: 25,

    //           ),
    //           ),
    //           label: const Icon(
    //             Icons.arrow_forward_ios,
    //             size: 50,
    //             color: Colors.white,
    //           ),
    //         ),
          // const Spacer(),
        ],
      ),
    ),
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