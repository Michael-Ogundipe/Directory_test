import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';

class ShowSimpleDialog extends StatelessWidget {
  const ShowSimpleDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Select an Option'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Go to Home Page'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Show  Simple Dialog'),
    );
  }
}
