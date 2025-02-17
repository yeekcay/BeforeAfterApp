import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Directionality(
      textDirection: TextDirection.ltr,
      child: DetailsList(),
    ));

class DetailsList extends StatelessWidget {
  const DetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            image: AssetImage("assets/images/bg_list2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomAppBar(
            color: Colors.black, // Change background color to black
            child: SizedBox(
              height: 40, // Reduce the height of the BottomAppBar
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
                    height: 136,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${item.author} · ${item.postedOn}",
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(), // Add Spacer to push buttons to the bottom
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildWhatsAppButton(),
                                  _buildOrderNowButton(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ),
                          ),
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
    );
  }

  Widget _buildWhatsAppButton() {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.green.shade800,
      onPressed: () async {
        const url = "https://wa.me/+201003806255/?text=Hello";
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
      child: const FaIcon(FontAwesomeIcons.whatsapp),
    );
  }

  Widget _buildOrderNowButton() {
    return TextButton(
      onPressed: ()  async {
        const url = "https://wa.me/+201003806255/?text=Hello";
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        textStyle: const TextStyle(fontSize: 12),
      ),
      child: const Text("Order Now"),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final String postedOn;

  Article({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.postedOn,
  });
}

final List<Article> _articles = [
  Article(
    title: "Anti-Aging Whitening Cream SPF 50+",
    author: "Naturally No.1",
    imageUrl: "https://i.ibb.co/pjsFW2W7/product1.jpg",
    postedOn: "300 AED",
  ),
  Article(
    title: "Anti-Aging Exfoliant",
    imageUrl: "https://i.ibb.co/VcfZgdYw/product2.jpg",
    author: "Naturally No.1",
    postedOn: "200 AED",
  ),
  Article(
    title: "Anti-Aging Day Cream SPF 50+",
    author: "Naturally No.1",
    imageUrl: "https://i.ibb.co/d4D2JPHW/product3.jpg",
    postedOn: "250 AED",
  ),
  Article(
    title: "Hair Elixir",
    author: "Naturally No.1",
    imageUrl: "https://i.ibb.co/6R8WpHCq/product4.jpg",
    postedOn: "200 AED",
  ),
  Article(
    title: "Facial Toner",
    author: "Naturally No.1",
    imageUrl: "https://i.ibb.co/ynmc0Dby/product5.jpg",
    postedOn: "150 AED",
  ),
  Article(
    title: "Anti Aging Night Cream",
    author: "Naturally No.1",
    imageUrl: "https://i.ibb.co/zT5dPcy7/product6.jpg",
    postedOn: "100 AED",
  ),
  Article(
    title: "Anti Aging Under-eye Cream",
    author: "Naturally NO.1",
    imageUrl: "https://i.ibb.co/yc5G9wpH/product7.jpg",
    postedOn: "200 AED",
  ),
];
