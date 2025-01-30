import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_perfect_plate/screens/HomePage.dart';
import 'package:the_perfect_plate/screens/profile.dart';
import '../utils/Routes.dart';
import '../screens/Signup.dart';
import '../screens/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  
  if(secureStorage.readSecureData(key)==null){
      runApp(const MyApp());
    }
    else{
      runApp(const MyApp2());
    }
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
          MyRoutes.LoginRoutes: (context) => const Login(),
          MyRoutes.ProfileRoutes: (context) => const Profile(),
          MyRoutes.HomeRoutes: (context) => const HomePage(),

        }
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>const HomePage(),
          MyRoutes.SignUpRoutes: (context) => const SignUp(),
          MyRoutes.LoginRoutes: (context) => const Login(),
          MyRoutes.ProfileRoutes: (context) => const Profile(),
          MyRoutes.HomeRoutes: (context) => const HomePage(),

        }
    );
  }
}
