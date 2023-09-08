import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigating back to the HomeScreen
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}