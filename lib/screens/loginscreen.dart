import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/animations.dart';

import '../data/bg_data.dart';
import '../utils/text_utils.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( const MyApp());
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex=0;
  bool showOption=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin:
        // const  EdgeInsets.symmetric(vertical: 10,),
        const EdgeInsets.only(
      left: 20,
      // top: 10,
      // right: 30,
      bottom: 660,
    ),
        height: 145,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        
        child: Row(
          
          children: [
            Expanded(

              child:  Image.asset("assets/images/logoanimate.gif",
              // Can add other properties on how you would like the anim to display
               alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              width: 400,
              height: 400,
            ),
            ),
        //         child:showOption? ShowUpAnimation(
        //           delay: 100,
        //           child: ListView.builder(
        //             shrinkWrap: true,
        //               itemCount: bgList.length,
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (context,index){
        //            return   GestureDetector(
        //              onTap: (){
        //                setState(() {
        //                  selectedIndex=index;
        //                });
        //              },
        //              child: CircleAvatar(
        //                radius: 30,

        //                backgroundColor:selectedIndex==index? Colors.white:Colors.transparent,
        //                child: Padding(
        //                  padding:const  EdgeInsets.all(1),
        //                  child: CircleAvatar(
        //                    radius: 30,
        //                    backgroundImage: AssetImage("assets/images/bg_animate.gif"),
        //                  ),
        //                ),
        //              ),
        //            );

        //           }),
        //         ):const SizedBox()),
        //    const  SizedBox(width: 20,),
        //    showOption? GestureDetector(
        //      onTap: (){
        //        setState(() {
        //          showOption=false;
        //        });
        //      },
        //        child:const  Icon(Icons.close,color: Colors.white,size: 30,)) :
        //    GestureDetector(
        //      onTap: (){
        //        setState(() {
        //          showOption=true;
        //        });
        //      },
        //      child: CircleAvatar(

        //         backgroundColor: Colors.white,
        //         child: Padding(
        //           padding:const  EdgeInsets.all(1),
        //           child: CircleAvatar(
        //             radius: 30,
        //             backgroundImage: AssetImage("assets/images/bg_animate.gif"),
        //      ),
        //         ),
        //       ),
        //    )
        //   ],
        // ),
          ],
      ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_animate.gif"),fit: BoxFit.cover
          ),

        ),
    alignment: Alignment.center,
    child: Container(
      height: 400,
      width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.1),


        ),
      child: ClipRRect(

        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(filter:ImageFilter.blur(sigmaY: 5,sigmaX: 5),
    child:Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const   Spacer(),
          Center(child: TextUtil(text: "Login",weight: true,size: 30,)),
          const   Spacer(),
          TextUtil(text: "Email",),
          Container(
            height: 35,
            decoration:const  BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))
            ),
            child:TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration:const  InputDecoration(
                suffixIcon: Icon(Icons.mail,color: Colors.white,),
               fillColor: Colors.white,
                border: InputBorder.none,),
            ),
          ),
          const   Spacer(),
            TextUtil(text: "Phone",),
          Container(
            height: 35,
            decoration:const  BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))
            ),
            child:TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration:const  InputDecoration(
                suffixIcon: Icon(Icons.phone,color: Colors.white,),
               fillColor: Colors.white,
                border: InputBorder.none,),
            ),
          ),
          const   Spacer(),
          TextUtil(text: "Password",),
          Container(
            height: 35,
            decoration:const  BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))
            ),
            child:TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration:const  InputDecoration(
                suffixIcon: Icon(Icons.lock,color: Colors.white,),
                fillColor: Colors.white,
                border: InputBorder.none,),
            ),
          ),
          const   Spacer(),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                color: Colors.white,
              ),
             const  SizedBox(width: 10,),
              Expanded(child: TextUtil(text: "Remember Me , FORGOT PASSWORD",size: 12,weight: true,))
            ],
          ), const   Spacer(),
          Container(
            height: 40,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            alignment: Alignment.center,
            child: TextUtil(text: "Log In",color: Colors.black,),
          ),
       const   Spacer(),
          Center(child: TextUtil(text: "Don't have an account REGISTER",size: 12,weight: true,)),
          const   Spacer(),


        ],
      ),
    ) ),
      ),
      ),


    ),



       );
  }
}