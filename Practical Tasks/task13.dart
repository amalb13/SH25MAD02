import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: AnimatedBoxExample(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedBoxExample extends StatefulWidget {
  const AnimatedBoxExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBoxExample> createState() => _AnimatedBoxExampleState();
}

class _AnimatedBoxExampleState extends State<AnimatedBoxExample> {
  // Step 1: Define initial width and height
  double _width = 100;
  double _height = 100;
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Example')),
      body: Center(
        // Step 2: Use AnimatedContainer
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
          child: const Center(
            child: Text(
              'Tap the Button!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      // Step 3: FloatingActionButton to trigger animation
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Step 4: Change size using setState
          setState(() {
            _width = _random.nextInt(200).toDouble() + 100; // random between 100–300
            _height = _random.nextInt(200).toDouble() + 100;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}