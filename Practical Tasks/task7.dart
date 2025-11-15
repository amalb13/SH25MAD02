import 'package:flutter/material.dart';
import 'dart:convert'; // Step 2: For json.decode()

void main() {
  runApp(const JsonDataApp());
}

class JsonDataApp extends StatelessWidget {
  const JsonDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSON Data Display',
      home: const JsonDataScreen(),
    );
  }
}

class JsonDataScreen extends StatefulWidget {
  const JsonDataScreen({super.key});

  @override
  State<JsonDataScreen> createState() => _JsonDataScreenState();
}

class _JsonDataScreenState extends State<JsonDataScreen> {
  // Step 1: Define a JSON string
  final String jsonString = '''
  [
    {"name": "Apple"},
    {"name": "Banana"},
    {"name": "Cherry"},
    {"name": "Mango"},
    {"name": "Orange"},
    {"name": "Grapes"}
  ]
  ''';

  late List<dynamic> fruits; // List to store parsed data

  @override
  void initState() {
    super.initState();
    // Step 2: Decode JSON string into a list
    fruits = json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits List (from JSON)'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      // Step 3: Display list using ListView.builder
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Colors.orange[50],
            child: ListTile(
              leading: const Icon(Icons.local_grocery_store, color: Colors.orange),
              title: Text(
                fruits[index]['name'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
