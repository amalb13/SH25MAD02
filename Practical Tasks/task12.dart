import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ColorToggler(),
    debugShowCheckedModeBanner: false,
  ));
}

class ColorToggler extends StatefulWidget {
  const ColorToggler({Key? key}) : super(key: key);

  @override
  State<ColorToggler> createState() => _ColorTogglerState();
}

class _ColorTogglerState extends State<ColorToggler> {
  // Step 1: Create a variable for background color
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Step 2: Apply color to Scaffold background
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Color Toggler Example'),
      ),
      body: const Center(
        child: Text(
          'Press the button to toggle color',
          style: TextStyle(fontSize: 18),
        ),
      ),
      // Step 3: Add FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Step 4: Toggle color using setState()
          setState(() {
            _backgroundColor =
                _backgroundColor == Colors.white ? Colors.blue : Colors.white;
          });
        },
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}