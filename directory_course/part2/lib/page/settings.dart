import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings ⚙️️',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ),
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
