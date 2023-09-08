import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Modal Bottom Sheet',
                      style: Theme.of(context).textTheme.displaySmall),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                    child: const Text('Go to Home Page'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      child: const Text('Show Modal Bottom Sheet'),
    );
  }
}
