import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize:MediaQuery.of(context).size.height,
      splash: 'assets/images/splash_screen.jpg',
      nextScreen: const FirstScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   ///Route for Navigating
//   static const routeName = '/SplashScreen';
//
//   @override
//   State<StatefulWidget> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State {
//   @override
//   initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3),
//         () => Navigator.pushReplacementNamed(context, '/FirstScreen'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Expanded(
//         child: Image.asset(
//           'assets/images/splash_screen.jpg',
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
