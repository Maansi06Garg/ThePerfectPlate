import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/Routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  Future <void> google() async{
    var request = http.Request('GET', Uri.parse('http://ec2-3-7-70-25.ap-south-1.compute.amazonaws.com:8006/googleOAuth'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // Navigator.pushReplacementNamed(context, MyRoutes.BottomNavBar);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future <void> SignApi() async {
    print("hiii");
    String apiUrl = 'http://ec2-3-7-70-25.ap-south-1.compute.amazonaws.com:8006/user/signup';
    final response = await http.post(
        Uri.parse(apiUrl),
        // headers: <String, String>{
        //   'Content-Type': 'application/json'
        // },
        body:({
          'name':nameController.text,
          'email':emailController.text,
          'password':passController.text,
        })
    );
    print("hiii");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.body),),);
    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
      // await Navigator.pushNamed(context, MyRoutes.LoginRoutes);

    } else {
      print('Failed to join the team. Status Code: ${response.statusCode}');
      print('Error Message: ${response.body}');
    }
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController passController =TextEditingController();
  TextEditingController roleController =TextEditingController();

  bool obscureText= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        decoration:BoxDecoration(
          color: Colors.purple.shade50.withOpacity(0.1),
          // image: DecorationImage(
          // image:AssetImage('lib/assets/BgAuth.png'),
          // fit: BoxFit.cover,),
        ),
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
                      "lib/assets/signup.jpg",
                      fit: BoxFit.fitWidth,
                      height: 250,
                    ),
                    const Text("Sign Up",style:TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
                    const Text("Agree to terms and conditions",style:TextStyle(fontSize: 14)),
                  ],),
                const SizedBox(height: 20,),
                Form(
                  key: _formKey,
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        ClipRRect(
                          borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                          child: Container(
                            height: 45,
                            width: 290,
                            color: Colors.grey,
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline),
                                hintText: "Username",
                                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Username can't be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height:10),
                        // ClipRRect(
                        //   borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                        //   child: Container(
                        //     height: 45,
                        //     width: 290,
                        //     color: Colors.grey,
                        //     child: TextFormField(
                        //       controller: roleController,
                        //       // obscureText: true,
                        //       decoration: InputDecoration(
                        //         // prefixIcon:Icon(Icons.looks),
                        //         prefixIcon:Icon(Icons.cached),
                        //         hintText: "Role",
                        //         contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                        //         // suffixIcon:  const Icon(Icons.visibility_off),
                        //         border:OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30.0),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),const SizedBox(height:10),
                        ClipRRect(
                          borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                          child: Container(
                            height: 45,
                            width: 290,
                            color: Colors.grey,
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
                        const SizedBox(height:10),
                        ClipRRect(
                          borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
                          child: Container(
                            height: 45,
                            width: 290,
                            color: Colors.grey,
                            child: TextFormField(
                              controller: passController,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                // prefixIcon:Icon(Icons.looks),
                                prefixIcon:Icon(Icons.lock),
                                hintText: "Password",
                                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
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

                        const SizedBox(height: 25,),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: 45,
                          width: 290,
                          child: ElevatedButton(onPressed: (){
                            if (_formKey.currentState!.validate()){
                            Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
                                // SignApi();
                              }
                            },
                            style:ElevatedButton.styleFrom(backgroundColor: Colors.black,
                              // padding: const EdgeInsets.symmetric(horizontal: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),

                            child: const Text("Sign up",style:TextStyle(color: Colors.white)),),
                        ),
                        // Recaptcha(),
                        const SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            const SizedBox(width: 3,),
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
                            }, child: const Text("Login",style:TextStyle(fontWeight: FontWeight.w500,color: Colors.black)))
                          ],
                        )
                      ]
                  ),),],
            ),
          ),
        ),
      ),

    );
  }
}