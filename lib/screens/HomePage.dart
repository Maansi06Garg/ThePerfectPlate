import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:the_perfect_plate/models/controller.dart';
import 'package:the_perfect_plate/screens/Cart.dart';
import 'package:the_perfect_plate/screens/Login.dart';
import '../utils/Routes.dart';
import 'Detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openCart,
        backgroundColor: Colors.white,
        child: Icon(Icons.shopping_cart,color: Colors.purple.shade900,),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: const Text("Maansi"),
            accountEmail: Text(emailController.text),
            currentAccountPicture:const  CircleAvatar(
              backgroundImage: AssetImage('lib/assets/prof.png'),
            ),
            decoration:const  BoxDecoration(
              color:  Color.fromARGB(255, 133, 69, 145),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,color: Color.fromARGB(255, 133, 69, 145),),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:const  Icon(Icons.person,color: Color.fromARGB(255, 133, 69, 145)),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
            },
          ),
          ListTile(leading: const Icon(Icons.shopping_cart,color: Color.fromARGB(255, 133, 69, 145)),
            title:const Text('My Cart'),
            onTap:
              openCart,
            ),
          ListTile(
            leading: const Icon(Icons.settings,color: Color.fromARGB(255, 133, 69, 145)),
            title:const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
            },
          ),
          ListTile(
            leading:const  Icon(Icons.help,color: Color.fromARGB(255, 133, 69, 145)),
            title: const Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout,color: Color.fromARGB(255, 133, 69, 145)),
            title: const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
            onTap: () {
              secureStorage.deleteSecureData(key);
              Navigator.pushReplacementNamed(context, MyRoutes.SignUpRoutes);
            },
          ),
        ],
      ),
    ),
      appBar:AppBar(
        title:  Row(
          children: [
            const Text("The Perfect Plate"),
            const SizedBox(width: 40,),
            IconButton(onPressed:(){
              Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
            } ,icon:const Icon(Icons.person_2_rounded)),
          ],
        ),
      ),
      body:ListView.builder(
        itemCount:dishes!.length,
        itemBuilder: (context,index){
        return ListTile(
          title:Container(
            width: MediaQuery.of(context).size.width/(4/3),
            height: MediaQuery.of(context).size.height/8,
            color: Colors.grey.shade50,
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                side: const BorderSide(color: Colors.purple, width: 1),
              ),
              onPressed: (){
                Navigator.push(context,  MaterialPageRoute(builder: (context) => Detail(det:dishes![index])));
              },
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width:MediaQuery.of(context).size.width/(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dishes![index][0],style: TextStyle(fontSize: 18),),
                          Text(dishes![index][1]),
                        ],
                      ),
                    ),
                    Image.asset(dishes![index][2],width:55,height:65),
                  ],
                ),
              ),
            ),
         );
        },
      ),
    );
  }
  Future<void> openCart() async {
    await Hive.openBox('cart');
    // final cartBox = await Hive.openBox('cart');
    // final cartItems = cartBox.values.toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }
}
