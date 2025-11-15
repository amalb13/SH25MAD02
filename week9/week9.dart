import 'dart:convert';
import 'dart:html'; // fetch API
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> data = [];

  Future<void> fetchData() async {
    final url = 'https://madl1-95a3d-default-rtdb.firebaseio.com/.json';

    try {
      final response = await HttpRequest.getString(url);
      final Map<String, dynamic>? fetched = json.decode(response);

      if (fetched != null) {
        setState(() {
          data = fetched.values.map((e) => e.toString()).toList();
        });
      } else {
        setState(() => data = []);
        print('No data found.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Data")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
          );
        },
      ),
    );
  }
}
