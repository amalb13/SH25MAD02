import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TabBarExample(),
    debugShowCheckedModeBanner: false,
  ));
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Step 1: DefaultTabController as root
    return DefaultTabController(
      length: 2, // Step 2: Two tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple TabBar Layout'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Chats', icon: Icon(Icons.chat)),
              Tab(text: 'Status', icon: Icon(Icons.circle)),
            ],
          ),
        ),
        // Step 4: TabBarView with two screens
        body: const TabBarView(
          children: [
            Center(child: Text('Chats Screen', style: TextStyle(fontSize: 18))),
            Center(child: Text('Status Screen', style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}