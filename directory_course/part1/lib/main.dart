import 'package:flutter/material.dart';

import 'package:navigation3_course/page/onboarding_with_provider.dart';
import 'package:navigation3_course/provider/drawer_provider.dart';
import 'package:navigation3_course/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

//void main() => runApp(const MyApp());

/// Todo: About 1 & 2.md
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   final RouteGenerator router = RouteGenerator();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.deepPurple,
//           foregroundColor: Colors.white,
//         ),
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       initialRoute: "/",
//       onGenerateRoute: router.routeGenerate,
//     );
//   }
// }

/// Todo: About 3.md

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.deepPurple,
//           foregroundColor: Colors.white,
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const DialogsPage(),
//     );
//   }
// }

/// Todo: About 4.md

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await UserPreferences().init();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     bool showOnboarding = UserPreferences.isOnboarded() ?? true;
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.deepPurple,
//           foregroundColor: Colors.white,
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: showOnboarding
//           ? const Onboarding(screenHeight: 50)
//           : const HomePage(),
//     );
//   }
// }

/// Todo: About 5.md

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawerProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingWithProvider(screenHeight: 50),
    );
  }
}
