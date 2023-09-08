import 'package:flutter/material.dart';
import 'package:navigation3_course/widget/card_stack.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final Widget child;
  final Animation<Offset> offsetAnimation;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.number,
    required this.child,
    required this.offsetAnimation,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          offsetAnimation: offsetAnimation,
          child: child,
        ),
        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 25.0),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Text(
            description,
            style:  TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }
}
