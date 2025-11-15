import 'package:flutter/material.dart';

void main() {
  runApp(const FadeInApp());
}

class FadeInApp extends StatelessWidget {
  const FadeInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fade-In Animation',
      home: const FadeInScreen(),
    );
  }
}

class FadeInScreen extends StatefulWidget {
  const FadeInScreen({super.key});

  @override
  State<FadeInScreen> createState() => _FadeInScreenState();
}

class _FadeInScreenState extends State<FadeInScreen> {
  bool _visible = false; // Step 1: Boolean variable

  @override
  void initState() {
    super.initState();
    // Step 2: Change visibility after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Fade-In Animation'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        // Step 3 & 4: AnimatedOpacity with duration and opacity toggle
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          // Step 5: Child widget (Welcome text)
          child: const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}