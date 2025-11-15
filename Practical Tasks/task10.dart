import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DragDropExample(),
    debugShowCheckedModeBanner: false,
  ));
}

class DragDropExample extends StatefulWidget {
  const DragDropExample({Key? key}) : super(key: key);

  @override
  State<DragDropExample> createState() => _DragDropExampleState();
}

class _DragDropExampleState extends State<DragDropExample> {
  Color targetColor = Colors.grey.shade300;
  String targetText = "Drop Here!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable & DragTarget Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step 1: Draggable Widget
          Center(
            child: Draggable<Color>(
              data: Colors.blue,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Drag Me",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              // Step 2: Feedback (slightly transparent)
              feedback: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    "Dragging...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: const Text("Empty"),
              ),
            ),
          ),
          const SizedBox(height: 80),
          // Step 3: DragTarget Widget
          DragTarget<Color>(
            onAccept: (color) {
              // Step 4: onAccept changes color/text
              setState(() {
                targetColor = color;
                targetText = "Dropped!";
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 150,
                height: 150,
                color: targetColor,
                alignment: Alignment.center,
                child: Text(
                  targetText,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}