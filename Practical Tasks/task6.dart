import 'package:flutter/material.dart';

void main() {
  runApp(const FancyListApp());
}

class FancyListApp extends StatelessWidget {
  const FancyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy ListView',
      home: const FancyListScreen(),
    );
  }
}

class FancyListScreen extends StatelessWidget {
  const FancyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Items'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 10, // Step 2
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal[200],
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                'Item ${index + 1}', // Step 4
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'This is description for item ${index + 1}',
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                print('Clicked on Item ${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}