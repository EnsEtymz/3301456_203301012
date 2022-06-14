import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD2-nDOvWaZzzexowRykYk7BFDoPciDXJM",
          appId: "1:928938492041:android:c4557c7831ff26190a4658",
          messagingSenderId: " ",
          projectId: "emailpasswordauth-2c1c1"));

  runApp(MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        Image.asset("assets/images/market.jpg"),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(right: 32.0),
          child: Text(
            "Market",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ]),
      backgroundColor: Colors.black,
      nextScreen: const HomePage(),
      splashIconSize: 290,
      duration: 2300,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
