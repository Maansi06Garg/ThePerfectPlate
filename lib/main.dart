import 'package:flutter/material.dart';
import 'package:the_perfect_plate/screens/HomePage.dart';
import 'package:the_perfect_plate/screens/profile.dart';
import 'package:the_perfect_plate/screens/vistors.dart';
import '../utils/Routes.dart';
import '../screens/Signup.dart';
import '../screens/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>const SignUp(),
          MyRoutes.SignUpRoutes: (context) => const SignUp(),
          MyRoutes.LoginRoutes: (context) => Login(),
          MyRoutes.ProfileRoutes: (context) => Profile(),
          MyRoutes.HomeRoutes: (context) => HomePage(),

        }
    );
  }
}

