import 'package:flutter/material.dart';

void main() {
  runApp(const ActionButtonsApp());
}

class ActionButtonsApp extends StatelessWidget {
  const ActionButtonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Action Buttons Row',
      home: const ActionButtonsScreen(),
    );
  }
}

class ActionButtonsScreen extends StatelessWidget {
  const ActionButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Buttons'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                print("Call button pressed");
              },
              icon: const Icon(Icons.call),
              color: Colors.green,
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                print("Message button pressed");
              },
              icon: const Icon(Icons.message),
              color: Colors.blue,
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                print("Email button pressed");
              },
              icon: const Icon(Icons.email),
              color: Colors.red,
              iconSize: 35,
            ),
          ],
        ),
      ),
    );
  }
}
