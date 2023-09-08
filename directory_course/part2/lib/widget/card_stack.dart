import 'package:flutter/material.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;

  final Widget child;
  final Animation<Offset> offsetAnimation;

  const CardsStack({
    super.key,
    required this.pageNumber,
    required this.child,
    required this.offsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(top: isOddPageNumber ? 25.0 : 50.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ],
      ),
    );
  }
}
