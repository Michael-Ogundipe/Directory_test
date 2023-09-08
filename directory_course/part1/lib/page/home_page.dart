import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation3_course/page/details_page.dart';
import 'package:navigation3_course/page/drawer_page.dart';
import 'package:navigation3_course/page/favorite_page.dart';
import 'package:navigation3_course/page/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsPage(),
              ),
            ),
            child: const Text('Go to Details Page'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            ),
            child: const Text('Go to Favorite Page'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            child: const Text('Go to Settings Page'),
          ),
        ],
      ),
    );
  }
}
