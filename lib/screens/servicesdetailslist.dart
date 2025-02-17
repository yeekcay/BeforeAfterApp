import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:beforeafterapp/screens/homescreen.dart'; 
import 'package:back_button_interceptor/back_button_interceptor.dart';

class ServiceDetailsList extends StatelessWidget {
  const ServiceDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const homescreen()),
        );
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clinic Offers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.dark,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("./assets/images/bg_list2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomAppBar(
              color: Colors.black,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
                    const Spacer(),
                    IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
                  ],
                ),
              ),
            ),
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: ListView.builder(
                  itemCount: _articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _articles[index];
                    return Container(
                      height: 220,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Hero(
                                    tag: 'title_${item.title}',
                                    child: Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Flexible(
                                  child: Text(
                                    item.description,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    maxLines: 15,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 25)),
                              Hero(
                                tag: 'image_${item.title}',
                                child: Container(
                                  width: 100,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: item.image,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 6)),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildWhatsAppButton(),
                                    _buildOrderNowButton(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhatsAppButton() {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.green.shade800,
      onPressed: () async {
        const url = "https://wa.me/+971589338680/?text=Hello";
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
      child: const FaIcon(FontAwesomeIcons.whatsapp),
    );
  }

  Widget _buildOrderNowButton() {
    return TextButton(
      onPressed: () async {
        const url = "https://wa.me/+971589338680/?text=Hello";
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        textStyle: const TextStyle(fontSize: 12),
      ),
      child: const Text("Book Now"),
    );
  }
}

class Article {
  final String title;
  final AssetImage image;
  final String description;
  final String postedOn;

  Article({
    required this.title,
    required this.image,
    required this.description,
    required this.postedOn,
  });
}

final List<Article> _articles = [
  Article(
    title: "Fillers",
    description: "Fillers are injectable treatments used to restore volume, smooth wrinkles, and enhance facial features. They can be injected into the lips, cheeks, jawline, chin, under-eyes, nasolabial folds, marionette lines, temples, nose, and hands. Results are immediate and typically last 6 months to 2 years.",
    image: const AssetImage("./assets/images/services/fillers.jpeg"),
    postedOn: "300 AED",
  ),
  Article(
    title: "Botox",
    image: const AssetImage("./assets/images/services/botox.jpeg"),
    description: "Botox is an injectable treatment used to relax facial muscles, reducing the appearance of fine lines and wrinkles. It is commonly injected into the forehead, frown lines (between the eyebrows), crow’s feet (around the eyes), bunny lines, jawline, chin, neck, and underarms. Results appear within a few days and last 3 to 6 months.",
    postedOn: "200 AED",
  ),
  Article(
    title: "Sculptra",
    description: "Sculptra is an injectable treatment that stimulates collagen production, restoring facial volume and improving skin texture over time. It is commonly used in the cheeks, temples, jawline, and nasolabial folds. Results appear gradually and can last up to two years.",
    image: const AssetImage("./assets/images/services/sculptra.jpeg"),
    postedOn: "250 AED",
  ),
  Article(
    title: "Skin Boosters",
    description: "Skin boosters are injectable treatments that deeply hydrate and improve skin texture by delivering hyaluronic acid and essential nutrients beneath the skin’s surface. They enhance skin elasticity, radiance, and smoothness, reducing fine lines and dryness. Commonly injected into the face, neck, hands, and décolletage.",
    image: const AssetImage("./assets/images/services/skinbooster.jpeg"),
    postedOn: "200 AED",
  ),
  Article(
    title: "HydraFacial",
    description: "HydraFacial is a non-invasive skincare treatment that deeply cleanses, exfoliates, extracts impurities, and hydrates the skin using a specialized vortex technology. It delivers nourishing serums and antioxidants, improving skin texture, tone, and hydration. Suitable for all skin types, HydraFacial provides instant radiance.",
    image: const AssetImage("./assets/images/services/hydrafacial.jpeg"),
    postedOn: "150 AED",
  ),
  Article(
    title: "Laser Hair Removal",
    description: "Laser hair removal uses light energy to target hair follicles, reducing growth over time. It’s effective on various body areas, with long-lasting results after multiple sessions.",
    image: const AssetImage("./assets/images/services/laserhairremoval.jpeg"),
    postedOn: "100 AED",
  ),
  Article(
    title: "Plastic Surgery",
    description: "Plastic surgery is a medical specialty that enhances or reconstructs facial and body features for aesthetic or medical purposes. It includes cosmetic procedures like facelifts, rhinoplasty, and liposuction, as well as reconstructive surgeries for injuries or birth defects. Results vary based on the procedure and individual goals.",
    image: const AssetImage("./assets/images/services/plasticsurgery.jpeg"),
    postedOn: "200 AED",
  ),
  Article(
    title: "Radiesse",
    description: "Radiesse is a dermal filler that restores volume and stimulates collagen production for long-lasting skin rejuvenation. It is commonly used to enhance the cheeks, jawline, hands, and nasolabial folds. Made of calcium hydroxylapatite (CaHA), Radiesse provides immediate results with continued improvement over time.",
    image: const AssetImage("./assets/images/services/radiesse.jpeg"),
    postedOn: "200 AED",
  ),
  Article(
    title: "Dental Treatments",
    description: "Preventive: Cleaning, fluoride, screening, mouthguards\nRestorative: Fillings, bridges, implants, dentures\nCosmetic: Whitening, veneers, bonding, contouring\nOrthodontic: Braces, Invisalign, retainers\nEndodontic: Root canal, pulpotomy\nPeriodontal",
    image: const AssetImage("./assets/images/services/dentaltreatment.jpeg"),
    postedOn: "200 AED",
  ),
];

