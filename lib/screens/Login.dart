import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_perfect_plate/models/controller.dart';

import '../models/storeToken.dart';
import '../utils/Routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final SecureStorage secureStorage=SecureStorage();
String key= 'accessToken';
class _LoginState extends State<Login> {

  TextEditingController passController =TextEditingController();
  

  Future <void> loginApi() async {
    String apiUrl = 'https://food-application-y9ow.onrender.com/user/login';
    final response = await http.post(
        Uri.parse(apiUrl),
        // headers: <String, String>{
        //   'Content-Type': 'application/json'
        // },
        body:({
          'email':emailController.text,
          'password':passController.text,
        })
    );
    // print(response.body);
    if (response.statusCode == 200) {

      // dynamic generateResponse = jsonDecode(response.body);
      // Token.fromJson(generateResponse);
      await secureStorage.writeSecureData(key,"hhhhhhhmmmmmmmmmmmmmmmaaaaaaaaaaaaaaa");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful"),),);
      // print('API Response: ${response.body}');
      await Navigator.pushReplacementNamed(context, MyRoutes.HomeRoutes);

    } else {
      // print('Failed to join the team. Status Code: ${response.statusCode}');
      // print('Error Message: ${response.body}');
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool obscureText= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "lib/assets/login.jpg",
                      height: 250,
                    ),
                    const SizedBox(height: 25,),
                    const Text("Login",style:TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
                    const Text("Agree to terms and conditions",style:TextStyle(fontSize: 14)),
                  ],),
                const SizedBox(height: 35,),
                Form(
                  key: _formKey,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      ClipRRect(
                        child: SizedBox(
                          width: 290,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: "Email",
                              contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email can't be empty";
                              }
                              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value)) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height:15),
                      ClipRRect(
                        // borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                        child: SizedBox(
                          width: 290,
                          // color: Colors.grey,
                          child: TextFormField(
                            controller: passController,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              prefixIcon:const Icon(Icons.lock),
                              hintText: "********",
                              contentPadding: const EdgeInsets.symmetric(vertical: 3.0),
                              suffixIcon:  IconButton(
                                icon: Icon(obscureText? Icons.visibility_off : Icons.visibility),
                                onPressed:(){
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password can't be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextButton(child:const Text("Forgot Password?",style: TextStyle(color: Colors.black),),onPressed: (){
                        // Navigator.pushNamed(context, MyRoutes.Reset);
                      },),
                      const SizedBox(height: 20,),
                      
                      SizedBox(
                        height: 45,
                        width: 290,
                        child: ElevatedButton(onPressed: (){
                          if (_formKey.currentState!.validate()){
                          loginApi();
                          }
                        },
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.black,
                            // padding: const EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),

                          child: const Text("Log in",style:TextStyle(color: Colors.white)),),
                      ),
                      const SizedBox(height: 35,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          const SizedBox(width: 3,),
                          TextButton(onPressed: (){
                            Navigator.pushReplacementNamed(context, MyRoutes.SignUpRoutes);
                          }, child: const Text("Sign up",style:TextStyle(fontWeight: FontWeight.w500,color: Colors.black)))
                        ],
                      ),
                    ],
                  ),),],
            ),
          ),
        ),
      ),

    );
  }
}
