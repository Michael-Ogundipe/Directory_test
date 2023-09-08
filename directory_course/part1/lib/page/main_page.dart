import 'package:flutter/material.dart';
import 'package:navigation3_course/page/drawer_page.dart';
import 'package:navigation3_course/page/favorite_page.dart';
import 'package:navigation3_course/page/settings.dart';
import 'package:navigation3_course/provider/drawer_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritePage()),
            ),
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            ),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: const DrawerPage(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.lightBlue, Colors.lightGreen])),
        child: context.watch<DrawerProvider>().page,
      ),
    );
  }
}