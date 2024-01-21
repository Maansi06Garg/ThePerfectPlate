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
    ["Pizza","onion, tomato","lib/assets/pizza.png"],
    ["Burger","Capsicon, cheese","lib/assets/burger.png"],
    ["Shake","cherry","lib/assets/shake.png"],
    ["Fried rice","Carrot","lib/assets/rice.png"],
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
           height: MediaQuery.of(context).size.height/10,
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
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dishes![index][0]),
                  Text(dishes![index][1]),
                ],
              ),
              // SizedBox(width:10),
              Image.asset(dishes![index][2],width:45,height:55),
            ],
          ),),
        ),);},
      ),
    );
  }
}
