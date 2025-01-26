import 'package:faker/faker.dart';
import 'package:flutter/material.dart';



void main() {
 var faker = Faker();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Flutter Demo',
 theme: ThemeData(
 primarySwatch: Colors.blue,
 ),
 home: const SearchScreen(),
 );
 }
}

class SearchScreen extends StatefulWidget {
   const SearchScreen({super.key});

@override
State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 List<String> items = List.generate(50, (index) => faker.food.dish());
 List<String> filteredItems = [];
 String _query = '';

 void search(String query) {
 setState(
 () {
 _query = query;

 filteredItems = items
 .where(
 (item) => item.toLowerCase().contains(
 query.toLowerCase(),
 ),
 )
 .toList();
 },
 );
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: TextField(
 style: const TextStyle(color: Colors.blue),
 onChanged: (value) {
 search(value);
 },
 decoration: const InputDecoration(
 hintText: 'Search...',
 hintStyle: TextStyle(color: Colors.white),
 fillColor: Colors.blue,
 prefixIcon: Icon(
 Icons.search,
 color: Colors.black,
 ),
 ),
 ),
 ),
body: filteredItems.isNotEmpty || _query.isNotEmpty
 ? filteredItems.isEmpty
 ? const Center(
 child: Text(
 'No Results Found',
 style: TextStyle(fontSize: 18),
 ),
 )
 : ListView.builder(
 itemCount: filteredItems.length,
 itemBuilder: (context, index) {
 return ListTile(
 title: Text(filteredItems[index]),
);
 },
 )
 : ListView.builder(
 itemCount: items.length,
itemBuilder: (context, index) {
 return ListTile(
 title: Text(items[index]),
 );
 },
 ),
 );
 }
}