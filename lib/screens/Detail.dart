import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_perfect_plate/models/controller.dart';
import 'package:the_perfect_plate/screens/Cart.dart';
import '../utils/Routes.dart';

class Detail extends StatefulWidget {
  Detail({super.key, required this.det});
  final dynamic det;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // final MessageController = TextEditingController();

  

  Future<void> addToCart() async {
    final cartBox = await Hive.openBox('cart');
    print("------");
    final item = {
      'name': widget.det![0],
      'image': widget.det![2],
      'description': widget.det![1],
      'customization': MessageController.text,
      'Each Price':widget.det![3],
      'Quantity':1,
    };
    await cartBox.add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item added to cart!')),
    );
    print(cartBox.values.toList());

    //  Navigator.pushNamed(context, MyRoutes.HomeRoutes);
  }

  Future<void> openCart() async {
    final cartBox = await Hive.openBox('cart');
    final cartItems = cartBox.values.toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("The Perfect Plate"),
            SizedBox(width: 40),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
              },
              icon: Icon(Icons.person_2_rounded),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCart,
        child: Icon(Icons.shopping_cart,color: Colors.purple.shade900,),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eat Well Feel Well Live Well...!!!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Image.asset(
                  widget.det![2],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  widget.det![0],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Each Price:"+
                widget.det![3],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Includes: " + widget.det![1],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Add customization",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 2,
                controller: MessageController,
                decoration: InputDecoration(
                  labelText: "Customize",
                  hintText: "Include:.... Exclude:....",
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed:addToCart,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


