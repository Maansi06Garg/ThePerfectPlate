// // import 'dart:ffi';

// import 'package:flutter/material.dart';

// import '../utils/Routes.dart';

// class Order extends StatefulWidget {
//   Order({super.key,required this.det,required this.message});
//   var message;
//   var det;
//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   int c = 1;
//   // c=count.text as int;
//   TextEditingController count=TextEditingController(text: "1");
//   TextEditingController Location=TextEditingController();
//   TextEditingController Phone=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Column(),
//       appBar:AppBar(
//         title:  Row(
//           children: [
//             Text("The Perfect Plate"),
//             SizedBox(width: 40,),
//             IconButton(onPressed:(){
//               Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
//             } ,icon:Icon(Icons.person_2_rounded)),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset(widget.det![2],width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/5),
//               SizedBox(height: 10,),
//               Text(widget.det![0],style:TextStyle(color: Colors.black,fontSize:30,fontWeight: FontWeight.w700)),
//               SizedBox(height: 10,),
//               TextFormField(
//                 controller: count,
//                 decoration: InputDecoration(
//                   labelText: "No. of item",
//                 ),
//               ),
          
//               TextFormField(
//                 minLines: 1,
//                 maxLines: 3,
//                 controller: Location,
//                 decoration: InputDecoration(
//                   labelText: "Location"
//                 ),
//               ),
//               TextFormField(
//                 controller: Phone,
//                 decoration: InputDecoration(
//                     labelText: "Phone No.",
//                 ),
//               ),
//               SizedBox(height: 10,),
//               widget.message.toString().length==0?Text("No Customization added"):Text("Customisation: "+widget.message),
//               SizedBox(height: 10,),
//               ElevatedButton(onPressed: (){
//               }, child: Text("Total Amount:"+widget.det[3])),
//               ElevatedButton(onPressed: (){
//                 Navigator.pushReplacementNamed(context, MyRoutes.HomeRoutes);
//               }, child: Text("Confirm Order")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
