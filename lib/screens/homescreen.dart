import 'dart:async';
import 'dart:ui';
// import 'package:beforeafterapp/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'productdetailslist.dart'; // Import the new file
import 'servicesdetailslist.dart';
import 'package:url_launcher/url_launcher.dart';

/// Flutter code sample for custom list items.

// void main() => runApp(const homescreen());

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return PopScope(
    //   canPop: false,
    //   onPopInvoked: (didPop) {
    //     if (didPop) {
    //       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(builder: (context) => const LoginScreen()));
    //     }
    //   },
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const CustomListItemExample(),
      debugShowCheckedModeBanner: false, // Remove the debug tag
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.clinicname,
    required this.treatmenttitle,
    required this.treatmentprice,
    required this.oldprice,
    required this.treatmentType,
  });

  final String clinicname;
  final String treatmenttitle;
  final String treatmentprice;
  final String oldprice;
  final String treatmentType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          clinicname,
          maxLines: 2,
          overflow: TextOverflow.visible,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Text(
          treatmenttitle,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Text(
              treatmentprice,
              style: const TextStyle(
                fontSize: 15.0,
                overflow: TextOverflow.clip,
                color: Colors.white,
                backgroundColor: Colors.deepOrange,
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 2.0)),
            Text(
              oldprice,
              style: const TextStyle(
                fontSize: 15.0,
                overflow: TextOverflow.clip,
                color: Colors.white,
                backgroundColor: Colors.transparent,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                decorationThickness: 3.0,
              ),
            ),
          ],
        ),
        Flexible(
          child: Text(
            treatmentType,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class OffersList extends StatelessWidget {
  const OffersList({
    super.key,
    required this.button,
    required this.textinfo,
    required this.buttondetails,
    required this.clinicname,
    required this.treatmenttitle,
    required this.treatmentprice,
    required this.oldprice,
    required this.treatmentType,
  });

  final Widget button;
  final Widget textinfo;
  final Widget buttondetails;
  final String clinicname;
  final String treatmenttitle;
  final String treatmentprice;
  final String oldprice;
  final String treatmentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
      child: Container(
        height: 138,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage("./assets/images/bg_list2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 2.0),
                  child: _ArticleDescription(
                    clinicname: clinicname,
                    treatmenttitle: treatmenttitle,
                    treatmentprice: treatmentprice,
                    oldprice: oldprice,
                    treatmentType: treatmentType,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  // height: 100,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add space between buttons
                    children: [
                      button,
                      buttondetails,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListItemExample extends StatefulWidget {
  const CustomListItemExample({super.key});

  @override
  _CustomListItemExampleState createState() => _CustomListItemExampleState();
}

class _CustomListItemExampleState extends State<CustomListItemExample> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  late Timer _timer;
  late Timer _scrollTimer;
  bool _scrollingDown = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    _scrollTimer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_scrollController.hasClients) {
        if (_scrollingDown) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 8),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            duration: const Duration(seconds: 6),
            curve: Curves.easeInOut,
          );
        }
        _scrollingDown = !_scrollingDown;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollTimer.cancel();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinic Offers',
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/bg_splash2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Clinic Offers'),
            //   leading: IconButton(
            //     icon: const Icon(Icons.list),
            //     onPressed: () {
            //       // Add functionality for the list icon if needed
            //     },
            //   ),
            // ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.black, // Change background color to black
              child: SizedBox(
                height: 40, // Reduce the height of the BottomAppBar
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
                    const Spacer(),
                    // IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                const SizedBox(height: 20), // Add padding at the top
                SizedBox(
                  height: 200,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Add padding around the image
                        child: Image.asset(
                          "./assets/images/before_logo.png",
                          alignment: AlignmentDirectional.center,
                          fit: BoxFit.contain,
                          width: 180,
                          height: 180,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Add padding around the image
                        child: Image.asset(
                          "./assets/images/specialoffer.png",
                          alignment: AlignmentDirectional.center,
                          fit: BoxFit.contain,
                          width: 180,
                          height: 180,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Add padding around the image
                        child: Image.asset(
                          "./assets/images/flashsale.png",
                          alignment: AlignmentDirectional.center,
                          fit: BoxFit.contain,
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        decorationThickness: 6,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            // image: DecorationImage(
                            //   image: AssetImage("./assets/images/bg_list2.jpg"),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("./assets/images/bg_list2.jpg"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/healthavenueplus.jpg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () async {
                                            const url = "https://wa.me/+971589338680/?text=Hello";
                                            final Uri uri = Uri.parse(url);
                                            await launchUrl(uri);
                                          },
                                          icon: const Text(
                                            "Book Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14, // Updated font size for consistency
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 24, // Updated icon size for consistency
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Health Avenue Plus',
                                        treatmenttitle: 'Free Hair Analysis',
                                        treatmentprice: '300AED',
                                        oldprice: '400AED',
                                        treatmentType: 'Serum Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/product1.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Anti-Aging Whitening Cream',
                                        treatmentprice: '279AED',
                                        oldprice: '279AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product2.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Anti Aging Exfoliant',
                                        treatmentprice: '252 AED',
                                        oldprice: '279AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product3.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Anti-Aging Day Cream',
                                        treatmentprice: '243AED',
                                        oldprice: '269AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product4.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Hair Elixir',
                                        treatmentprice: '296AED',
                                        oldprice: '329AED',
                                        treatmentType: 'Hair Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product5.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Facial Toner',
                                        treatmentprice: '179AED',
                                        oldprice: '199AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product6.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const DetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Anti-Aging Night Cream',
                                        treatmentprice: '259AED',
                                        oldprice: '289AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0), // Slightly reduce right padding
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/products/product7.jpeg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "Buy Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Naturally No. 1',
                                        treatmenttitle: 'Anti-Aging Undereye Cream',
                                        treatmentprice: '287AED',
                                        oldprice: '319AED',
                                        treatmentType: 'Skin Treatment',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/FmcMedical.jpg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () async {
                                            const url = "https://wa.me/+971589338680/?text=Hello";
                                            final Uri uri = Uri.parse(url);
                                            await launchUrl(uri);
                                          },
                                          icon: const Text(
                                            "Book Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'FMC Medical',
                                        treatmenttitle: '15% Discount!',
                                        treatmentprice: '300AED',
                                        oldprice: '400AED',
                                        treatmentType: 'Filler Botox',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/este.jpg"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () async {
                                            const url = "https://wa.me/+971589338680/?text=Hello";
                                            final Uri uri = Uri.parse(url);
                                            await launchUrl(uri);
                                          },
                                          icon: const Text(
                                            "Book Now",
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
                                        textinfo: const Text(
                                          "More Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            decorationStyle: TextDecorationStyle.double,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: 'Este Medical Group',
                                        treatmenttitle: '15% Discount!',
                                        treatmentprice: '300AED',
                                        oldprice: '400AED',
                                        treatmentType: 'Hair Transplant',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Set a consistent width
                                      height: 100, // Set a consistent height
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage("./assets/images/7dental.png"),
                                          fit: BoxFit.contain, // Ensure the whole image is showing
                                          alignment: Alignment.center, // Center the image
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OffersList(
                                        button: TextButton.icon(
                                          onPressed: () async {
                                            const url = "https://wa.me/+971589338680/?text=Hello";
                                            final Uri uri = Uri.parse(url);
                                            await launchUrl(uri);
                                          },
                                          icon: const Text(
                                            "Book Now",
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
                                        textinfo: const Text(
                                          "Free Hair Analysis",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        buttondetails: TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ServiceDetailsList()),
                                            );
                                          },
                                          icon: const Text(
                                            "More Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          label: const Icon(
                                            Icons.info_outline,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        clinicname: '7 Dental Center',
                                        treatmenttitle: 'Free Dental!',
                                        treatmentprice: '300AED',
                                        oldprice: '400AED',
                                        treatmentType: 'Dec 28',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
