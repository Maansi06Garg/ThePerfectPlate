import 'package:flutter/material.dart';
import '../utils/Routes.dart';
import 'Detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dishes=[
    ["Pizza","onion, tomato, Mushroom, Capsicum, Pepper","lib/assets/pizza.png","Rs. 100"],
    ["Burger","Capsicum, cheese, tomato, onion","lib/assets/burger.png","Rs. 40"],
    ["Chocolate Shake","cookies like oreo, candy bar, chocolate chips, cherry","lib/assets/shake.png","Rs. 80"],
    ["Fried rice","Carrot, Green pea, onion, tomato,  Mushroom","lib/assets/rice.png","Rs. 60"],
    ["Veg North Thali","Dal Makhni, Paneer, Palak Paneer, Rice, Salad,4 Naan, Kheer","lib/assets/signup.jpg","Rs. 250"],
    ["Veg Chinese Meal","Spring Roll, Momos, Kimchi Salad, Paneer chilli, Manchurian,Noodles","lib/assets/chinese.png","Rs. 280"],

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Column(),
      appBar:AppBar(
        title:  Row(
          children: [
            Text("The Perfect Plate"),
            SizedBox(width: 40,),
            IconButton(onPressed:(){
              Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
            } ,icon:Icon(Icons.person_2_rounded)),
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
              Container(
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
              // SizedBox(width:10),
              Image.asset(dishes![index][2],width:55,height:65),
            ],
          ),),
        ),);},
      ),
    );
  }
}
