import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';
import 'package:navigation3_course/provider/drawer_provider.dart';
import 'package:provider/provider.dart';

class DrawerProviderPage extends StatelessWidget {
  const DrawerProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/userPage'),
              child: const UserAccountsDrawerHeader(
                accountEmail: Text('heyflutter@gmail.com'),
                accountName: Text('Hey Flutter Team'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () =>
                  Provider.of<DrawerProvider>(context, listen: false)
                      .changePage(Pages.homepage),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () => Provider.of<DrawerProvider>(context, listen: false)
                  .changePage(Pages.favorite),
            ),
            ListTile(
                leading: const Icon(Icons.notifications_active_sharp),
                title: const Text('Notifications'),
                onTap: () => Provider.of<DrawerProvider>(context, listen: false)
                    .changePage(Pages.notification)),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
