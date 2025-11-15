import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageGalleryScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  final List<String> imageUrls = const [
    'https://picsum.photos/id/1018/200/200',
    'https://picsum.photos/id/1025/200/200',
    'https://picsum.photos/id/1035/200/200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Gallery')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Image ${index + 1} tapped'),
                    duration: const Duration(seconds: 1),
                  ),
                );
                print('Image ${index + 1} tapped');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
