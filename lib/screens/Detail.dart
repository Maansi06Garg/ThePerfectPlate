import 'package:flutter/material.dart';
import 'package:the_perfect_plate/screens/Order.dart';
import '../utils/Routes.dart';

class Detail extends StatefulWidget {
  Detail({super.key,required this.det});
  dynamic det;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController MessageController =TextEditingController();
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
      body:SingleChildScrollView(
        child:Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Eat Well Feel Well Live Well...!!!",style:TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500)),
            SizedBox(height: 30,),
            Image.asset(widget.det![2],width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/4),
            SizedBox(height: 20,),
            Text(widget.det![0],style:TextStyle(color: Colors.black,fontSize:30,fontWeight: FontWeight.w700)),
            SizedBox(height: 20,),
            Text("Includes: "+widget.det![1],style:TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w400)),
            SizedBox(height: 20,),
            Text("Add customization",style:TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500)),
            SizedBox(height: 10,),
            TextFormField(
            maxLines: 2,
            controller: MessageController,
            decoration: InputDecoration(
              labelText: "Customize",
              hintText: "Include:.... Exclude:....",
              contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
              // suffixIcon: Icon(Icons.visibility),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Order(det: widget.det, message: MessageController.text),));
          },child:Text("Order")),
          ]
        ),),
      ),
    );
  }
}
