import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AllTasksScreen(),
      );
}

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Combined Widgets"),
            actions: [IconButton(icon: const Icon(Icons.settings), onPressed: () {})],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                ProfileCard(),
                Divider(height: 40),
                RatingWidget(),
                Divider(height: 40),
                ContentToggle(),
              ],
            ),
          ),
        ),
      );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) => Column(
        children: [
          CircleAvatar(
            radius: 53,
            backgroundColor: Colors.grey.shade300,
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Amal Benny",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Flutter Developer | Tech Enthusiast",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _stat("Posts", "120"),
              _stat("Followers", "1.2M"),
              _stat("Following", "350"),
            ],
          ),
        ],
      );

  Widget _stat(String label, String count) => Column(
        children: [
          Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      );
}

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Text("Rate this App", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) => IconButton(
                  icon: Icon(i < _rating ? Icons.star : Icons.star_border, color: Colors.amber),
                  onPressed: () => setState(() => _rating = i + 1),
                )),
          ),
          Text("Your Rating: $_rating", style: const TextStyle(fontSize: 16)),
        ],
      );
}

class ContentToggle extends StatefulWidget {
  const ContentToggle({super.key});
  @override
  State<ContentToggle> createState() => _ContentToggleState();
}

class _ContentToggleState extends State<ContentToggle> {
  bool _showFull = false;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
              children: [
                const TextSpan(
                    text:
                        "Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications"),
                if (_showFull)
                  const TextSpan(
                    text:
                        " from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows. This allows developers to write the code once and deploy it on multiple platforms, saving significant time and resources.",
                    style: TextStyle(color: Colors.black54),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            child: Text(_showFull ? "Read Less" : "Read More"),
            onPressed: () => setState(() => _showFull = !_showFull),
          ),
        ],
      );
}
