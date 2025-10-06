import 'package:flutter/material.dart';

void main() {
  runApp(NavigationGestureApp());
}

class NavigationGestureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation & Gestures Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      // Named routes
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
      },
      initialRoute: '/',
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Heading Text
              const Text(
                "Navigation & Gesture Demo",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),

              // Navigation Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text("Go to Second Page"),
              ),
              const SizedBox(height: 30),

              // Gesture Example
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Container Tapped!")),
                  );
                },
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Double Tapped!")),
                  );
                },
                onLongPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Long Pressed!")),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade400,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Try: Tap, Double Tap, or Long Press",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
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

// Second Page
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline,
                size: 80, color: Colors.teal),
            const SizedBox(height: 20),
            const Text(
              "You are on the Second Page!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
