import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';
import 'package:navigation3_course/page/onboarding_page.dart';
import 'package:navigation3_course/widget/next_page.dart';
import 'package:navigation3_course/widget/page_indicator.dart';
import 'package:navigation3_course/widget/ripple.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    super.key,
    required this.screenHeight,
  });

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late final AnimationController cardsAnimationController;
  late final AnimationController pageIndicatorAnimationController;
  late final AnimationController rippleAnimationController;

  late Animation<Offset> slideAnimationLightCard;
  late Animation<Offset> slideAnimationDarkCard;
  late Animation<double> pageIndicatorAnimation;
  late Animation<double> rippleAnimation;

  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    cardsAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    rippleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: rippleAnimationController,
      curve: Curves.easeIn,
    ));

    setPageIndicatorAnimation();
    setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    cardsAnimationController.dispose();
    pageIndicatorAnimationController.dispose();
    rippleAnimationController.dispose();
    super.dispose();
  }

  Widget pages() {
    switch (currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          offsetAnimation: slideAnimationDarkCard,
          title: 'Welcome to PowerPage',
          description: 'Where your reading journey meets enhanced productivity',
          child: Image.asset('assets/onboarding1.png'),
        );
      case 2:
        return OnboardingPage(
          number: 2,
          offsetAnimation: slideAnimationDarkCard,
          title: 'Turbocharge Your Reading',
          description:
              'Elevate your reading experience with PowerPage\'s tools to set goals, track progress, and manage your list effortlessly.',
          child: Image.asset('assets/onboarding1.png'),
        );
      case 3:
        return OnboardingPage(
          number: 3,
          offsetAnimation: slideAnimationDarkCard,
          title: 'Achieve More with PowerPage',
          description:
              'Achieve more as you organize, annotate, and learn with PowerPage, your ultimate book productivity companion.',
          child: Image.asset('assets/onboarding1.png'),
        );
      default:
        throw Exception("Page with number '$currentPage' does not exist.");
    }
  }

  void setCardsSlideInAnimation() {
    setState(() {
      slideAnimationLightCard = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: cardsAnimationController,
        curve: Curves.easeOut,
      ));
      slideAnimationDarkCard = Tween<Offset>(
        begin: const Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: cardsAnimationController,
        curve: Curves.easeOut,
      ));
      cardsAnimationController.reset();
    });
  }

  void setCardsSlideOutAnimation() {
    setState(() {
      slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: cardsAnimationController,
        curve: Curves.easeIn,
      ));
      slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: cardsAnimationController,
        curve: Curves.easeIn,
      ));
      cardsAnimationController.reset();
    });
  }

  void setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      pageIndicatorAnimationController.reset();
    });
  }

  void setNextPage(int nextPageNumber) =>
      setState(() => currentPage = nextPageNumber);

  Future<void> nextPage() async {
    switch (currentPage) {
      case 1:
        if (pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          pageIndicatorAnimationController.forward();
          await cardsAnimationController.forward();
          setNextPage(2);
          setCardsSlideInAnimation();
          await cardsAnimationController.forward();
          setCardsSlideOutAnimation();
          setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          pageIndicatorAnimationController.forward();
          await cardsAnimationController.forward();
          setNextPage(3);
          setCardsSlideInAnimation();
          await cardsAnimationController.forward();
        }
        break;
      case 3:
        if (pageIndicatorAnimation.status == AnimationStatus.completed) {
          await goToHomePage();
        }
        break;
    }
  }

  Future<void> goToHomePage() async {
    await rippleAnimationController.forward();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  Expanded(child: pages()),
                  AnimatedBuilder(
                    animation: pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: pageIndicatorAnimation.value,
                        currentPage: currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(onPressed: nextPage),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(radius: rippleAnimation.value);
            },
          ),
        ],
      ),
    );
  }
}
