import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/Routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName="";
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        const CircleAvatar(
          radius: 80.0,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage('lib/assets/prof.png'),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "User",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Divider(
          thickness: 1.0,
          color: Colors.grey.withOpacity(0.65),
        ),
        _buildProfile('Edit Profile', Icons.edit_square),
        Divider(
          thickness: 1.0,
          color: Colors.grey.withOpacity(0.65),
        ),
        _buildProfile('Security', Icons.security),
        Divider(
          thickness: 1.0,
          color: Colors.grey.withOpacity(0.65),
        ),
        _buildProfile('Suggestion and Feedback', Icons.feedback),
        Divider(
          thickness: 1.0,
          color: Colors.grey.withOpacity(0.65),
        ),
        // _buildProfile('Logout', Icons.logout, Colors.red),
        TextButton(onPressed: (){
          // secureStorage.deleteSecureData(key);
          Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
        }, child: const Row(
          children: [
            Icon(Icons.logout,color: Colors.red,),
            SizedBox(width: 10,),
            Text("Logout",style:TextStyle(color: Colors.red,fontSize: 20)),
          ],
        ))
      ],
    ),
  );
}

Widget _buildProfile(String optionText, IconData icon, [Color? textColor]) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (textColor == Colors.red)
                Icon(
                  icon,
                  size: 20.0,
                  color: Colors.red,
                ),
              if (textColor != Colors.red)
                Icon(
                  icon,
                  size: 20.0,
                ),
              const SizedBox(
                width: 10,
              ),
              Text(
                optionText,
                style: TextStyle(
                  fontSize: 18.0,
                  color: textColor ?? Colors.black,
                ),
              ),
            ],
          ),
          if (textColor != Colors.red)
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20.0,
              color: Color.fromARGB(255, 101, 56, 108),
            ),
        ],
      ),
    ),
  );
}
}
