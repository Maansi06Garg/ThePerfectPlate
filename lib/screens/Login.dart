import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_perfect_plate/models/controller.dart';
import 'package:the_perfect_plate/screens/profile.dart';
import 'dart:convert';
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
  

  Future <void> LoginApi() async {
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
    print(response.body);
    if (response.statusCode == 200) {

      // dynamic generateResponse = jsonDecode(response.body);
      // Token.fromJson(generateResponse);
      await secureStorage.writeSecureData(key,"hhhhhhhmmmmmmmmmmmmmmmaaaaaaaaaaaaaaa");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful"),),);
      print('API Response: ${response.body}');
      await Navigator.pushNamed(context, MyRoutes.HomeRoutes);

    } else {
      print('Failed to join the team. Status Code: ${response.statusCode}');
      print('Error Message: ${response.body}');
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
        // decoration:const BoxDecoration(
        //   image: DecorationImage(
        //   image:AssetImage('lib/assets/BgAuth.png'),
        //   fit: BoxFit.cover,),
        // ),
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            // child: Form(
            //   key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "lib/assets/login.jpg",
                      // fit: BoxFit.fitWidth,
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
                        // borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                        child: Container(
                          width: 290,
                          // color: Colors.grey,
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
                        child: Container(
                          width: 290,
                          // color: Colors.grey,
                          child: TextFormField(
                            controller: passController,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              // prefixIcon:Icon(Icons.looks),
                              prefixIcon:Icon(Icons.lock),
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
                      // Row(
                      //   children:[
                      //     Text("Remind me nextime"),
                      //   ],
                      // ),
                      SizedBox(
                        height: 45,
                        width: 290,
                        child: ElevatedButton(onPressed: (){
                          if (_formKey.currentState!.validate()){
                          // Navigator.pushReplacementNamed(context, MyRoutes.HomeRoutes);
                          
                          LoginApi();
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
                      // Recaptcha(),
                    ],
                  ),),],
            ),
          ),
        ),
      ),

    );
  }
}
//
// // import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:the_perfect_plate/models/storeToken.dart';
//
// // String key= 'accessToken';
// // @RoutePage()
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.blueAccent,
//         title: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Image.asset('lib/assets/AKGEC.png',width: MediaQuery.of(context).size.width/8,),
//               SizedBox(width: 10,),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("AJAY KUMAR GARG",style: TextStyle(color: Colors.white),),
//                   Text("ENGINEERING COLLEGE",style: TextStyle(color: Colors.white),),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height/5,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.blueAccent,
//             ),
//             Positioned(child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.blue.shade50,
//             ),
//              top: MediaQuery.of(context).size.height/5,),
//             Positioned(child:
//             Center(
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadiusDirectional.all(Radius.circular(9.0)),
//                     child: Container(
//                       color: Colors.white,
//                       width: MediaQuery.of(context).size.width/1.2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Text("JAI HIND!",style:TextStyle(color: Colors.black,fontSize:35,fontWeight:FontWeight.w600)),
//                             Text("Login to continue",style:TextStyle(fontWeight: FontWeight.w300)),
//                             SizedBox(
//                               width: 150,
//                               height: 150,
//                               child: Image.asset('lib/assets/login_v.png'),
//                             ),
//                             // const SizedBox(height: 80),
//                             const LoginForm(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height:20),
//                   Image.asset("lib/assets/blockChainLogo.png",
//                   width: MediaQuery.of(context).size.width/1.4,
//                   // height: 50,
//                   ),
//                 ],
//               ),
//             ),
//               )
//         ],
//       ),
//       ),
//     );
//   }
// }
//
// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});
//
//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }
//
// class _LoginFormState extends State<LoginForm> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   bool _isPasswordVisible = false;
//   final _formKey = GlobalKey<FormState>();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Username"),
//           Container(
//             color: Colors.grey.shade200,
//             child: TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your username',
//                 // prefixIcon: Icon(Icons.email),
//
//               border:OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(3.0),
//               ),),
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Username can't be empty";
//                 }
//                 // if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                 //     .hasMatch(value)) {
//                 //   return 'Invalid email address';
//                 // }
//                 return null;
//               },
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text("Password"),
//           Container(
//             color: Colors.grey.shade200,
//             child: TextFormField(
//               controller: _passwordController,
//               obscureText: !_isPasswordVisible,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 // labelText: 'Password',
//                 hintText: '*******',
//                 // prefixIcon: const Icon(Icons.lock),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isPasswordVisible = !_isPasswordVisible;
//                     });
//                   },
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(5.0),
//                 )
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Password can't be empty";
//                 }
//                 return null;
//               },
//             ),
//           ),
//           const SizedBox(height: 40),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 102, 133, 250),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   final email = _emailController.text;
//                   final password = _passwordController.text;
//                   if (kDebugMode) {
//                     print('Email: $email, Password: $password');
//                   }
//                   final SecureStorage secureStorage = SecureStorage();
//                   dynamic generateResponse = "gstumri87gr";
//                   secureStorage
//                       .writeSecureData('key', generateResponse)
//                       .then(
//                         (_) => Navigator.of(context).pushReplacementNamed('/home'),
//                   )
//                       .catchError(
//                         (error) => ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(error),
//                       ),
//                     ),
//                   );
//                 }
//               },
//               child: const Text(
//                 'Login',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
