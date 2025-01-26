import 'package:flutter/material.dart';

/// Flutter code sample for custom list items.

void main() => runApp(const CustomListItemApp());

class CustomListItemApp extends StatelessWidget {
  const CustomListItemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const CustomListItemExample(),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    // required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  // final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        // Expanded(
        //   child: Text(
        //     subtitle,
        //     maxLines: 2,
        //     overflow: TextOverflow.ellipsis,
        //     style: const TextStyle(
        //       fontSize: 12.0,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        Text(
          author,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            backgroundColor: Colors.deepOrange,
          ),
        ),
        Text(
          '$publishDate - $readDuration',
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.button,
    required this.title,
    // required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });
  final Widget thumbnail;
  final Widget button;
  final String title;
  // final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  // subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
            Container(
              child:button,


            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItemExample extends StatelessWidget {
  const CustomListItemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Container(
        
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_splash2.png"), fit: BoxFit.cover)), 
         child: 
        Container(
        
        child: Scaffold(
           backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 5,
        title: const Text('Clinics Offers'),
        ),
      body: ListView(
        padding: const EdgeInsets.all(2.0),
        children:
        
         <Widget>[
         
    Image.asset("assets/images/logoanimate.gif",
              // Can add other properties on how you would like the anim to display

              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
              DecoratedBox( 
                 decoration: 
                 const BoxDecoration( borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ), 
            image: DecorationImage(
                image: AssetImage("assets/images/bg_list2.jpg"), 
                fit: BoxFit.cover,

                
                
                
                ),
                ),
        child:Column(
          mainAxisSize: MainAxisSize.max,

            
          children: [
            SizedBox(
              height: 37,
              width: 380,
              child: TextField(
                style: const TextStyle(
                  color: Color(0xff020202),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                onChanged: print,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xfff1f1f1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for Offers",
                  hintStyle: const TextStyle(
                    height: 1,
                      overflow: TextOverflow.fade,
                      color: Color(0xffb2b2b2),
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.3,
                      decorationThickness: 6),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  // prefixIconConstraints: BoxConstraints(maxHeight: 35),
                ),
              ),
            ),
          Container(
              padding: const EdgeInsets.symmetric(),
           decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_list.jpg"), 
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                
                )), 
            
          ),
          CustomListItemTwo(


             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),

            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/este.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Este Medical group',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Free Hair Analysis',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),
            CustomListItemTwo(



               button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),

            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/beyou.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Be You Clinics',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'PROMOCODE',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),
              CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/FmcMedical.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'FMC Medical',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: '15% Discount!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

          CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/charisma.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Charisma Medical Center',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: '15% Discount!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

          CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/7dental.png"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: '7 Dental Center',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Free Dental!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

          CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/ziedas.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Ziedas',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Package Offer!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

           CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/ziedas.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Ziedas',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Package Offer!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

           CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/ziedas.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Ziedas',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Package Offer!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

           CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/ziedas.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Ziedas',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Package Offer!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

           CustomListItemTwo(
             button: TextButton.icon(
              onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              // );
            },
              icon: const Text("Book Now",
              style: TextStyle(
               color: Colors.white,

              ),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),




            thumbnail: Container(
              decoration: const BoxDecoration(

                            image: DecorationImage(
                image: const AssetImage("assets/images/ziedas.jpg"), 
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  
                  
                  )


              ),
            ),
            title: 'Ziedas',
            // subtitle: 'Flutter continues to improve and expand its horizons. '
            //     'This text should max out at two lines and clip',
            author: 'Package Offer!',
            publishDate: 'Dec 28',
            readDuration: '5 mins',
          ),

          ],
        ),
              ),
        ],
      ),
    ),
        ),
      ),
    );
  }
}
