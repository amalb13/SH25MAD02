import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MainScreen(),
      );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final pages = [const SpotifyScreen(), const DraggableNotesScreen()];

  @override
  Widget build(BuildContext c) => Scaffold(
        body: AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: pages[index]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Listen Now'),
            BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Notes'),
          ],
        ),
      );
}

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: const Text('Now Playing'), centerTitle: true),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Changed background to gradient instead of an image to avoid overflow
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.black87],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(color: Colors.black54),
            ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Image.network('https://picsum.photos/id/1018/400', height: 250),
                const SizedBox(height: 20),
                Text(
                  'Mountain Sunrise',
                  style: Theme.of(c).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'By Nature Sounds',
                  style: Theme.of(c).textTheme.titleMedium?.copyWith(color: Colors.grey[400]),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.shuffle),
                    Icon(Icons.skip_previous),
                    Icon(Icons.play_circle_fill, size: 60),
                    Icon(Icons.skip_next),
                    Icon(Icons.repeat),
                  ],
                ),
                const SizedBox(height: 20),
                ...List.generate(
                  8,
                  (i) => ListTile(
                    leading: Text('${i + 1}'),
                    title: Text('Track ${i + 1}', style: Theme.of(c).textTheme.bodyMedium),
                    trailing: const Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class DraggableNotesScreen extends StatefulWidget {
  const DraggableNotesScreen({super.key});
  @override
  State<DraggableNotesScreen> createState() => _DraggableNotesScreenState();
}

class _DraggableNotesScreenState extends State<DraggableNotesScreen> {
  final List<Widget> notes = [];

  void addNote() {
    final rnd = Random();
    final offset = Offset(50 + rnd.nextDouble() * 150, 50 + rnd.nextDouble() * 300);
    setState(() => notes.add(DraggableNote(key: UniqueKey(), initialOffset: offset)));
  }

  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: const Text('Draggable Notes')),
        body: Stack(children: notes),
        floatingActionButton: FloatingActionButton(onPressed: addNote, child: const Icon(Icons.add)),
      );
}

class DraggableNote extends StatefulWidget {
  final Offset initialOffset;
  const DraggableNote({super.key, this.initialOffset = Offset.zero});

  @override
  State<DraggableNote> createState() => _DraggableNoteState();
}

class _DraggableNoteState extends State<DraggableNote> {
  final TextEditingController ctrl = TextEditingController();
  late Offset offset;
  double scale = 1.0;
  late Offset dragStart;
  late double scaleStart;

  @override
  void initState() {
    super.initState();
    offset = widget.initialOffset;
  }

  @override
  Widget build(BuildContext c) => Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onScaleStart: (d) {
            dragStart = d.focalPoint;
            scaleStart = scale;
          },
          onScaleUpdate: (d) {
            setState(() {
              offset += d.focalPoint - dragStart;
              dragStart = d.focalPoint;
              scale = (scaleStart * d.scale).clamp(0.5, 3);
            });
          },
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(8),
              color: Colors.yellow.shade200,
              child: TextField(
                controller: ctrl,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Your note...'),
              ),
            ),
          ),
        ),
      );
}
