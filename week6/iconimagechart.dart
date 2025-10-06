import 'package:flutter/material.dart';

void main() {
  runApp(MyBetterBarChartApp());
}
class MyBetterBarChartApp extends StatefulWidget {
  @override
  _MyBetterBarChartAppState createState() => _MyBetterBarChartAppState();
}
class _MyBetterBarChartAppState extends State<MyBetterBarChartApp> {
  final List<Map<String, dynamic>> barData = [
    {"label": "A", "value": 3.0, "color": Colors.blueAccent},
    {"label": "B", "value": 5.0, "color": Colors.greenAccent.shade700},
    {"label": "C", "value": 2.0, "color": Colors.orangeAccent},
    {"label": "D", "value": 4.0, "color": Colors.purpleAccent},
  ];
  bool _animate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _animate = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Better Bar Chart",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xfff4f9f9),
        appBar: AppBar(
          title: const Text("Flutter Bar Chart"),
          backgroundColor: Colors.teal.shade400,
          elevation: 4,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded,
                    color: Colors.amber, size: 60),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Animated Bar Chart",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: barData.map((data) {
                      final double height = _animate ? data["value"] * 30 : 0;
                      return _AnimatedBar(
                        label: data["label"],
                        value: data["value"],
                        color: data["color"],
                        height: height,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _randomizeValues,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text("Refresh"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade400,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _randomizeValues() {
    setState(() {
      for (var item in barData) {
        item["value"] = (2 + (5 * (0.5 + (0.5 - (DateTime.now().millisecond % 100) / 100))));
      }
      _animate = false;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => _animate = true);
    });
  }
}
class _AnimatedBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final double height;
  const _AnimatedBar({
    required this.label,
    required this.value,
    required this.color,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value.toStringAsFixed(1),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          height: height,
          width: 28,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}