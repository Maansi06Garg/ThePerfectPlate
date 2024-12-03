import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box('cart');
    final cartItems = cartBox.values.toList();

    void showItemDetails(BuildContext context, dynamic item, int index) {
      int quantity = item['quantity'] ?? 1; // Initialize quantity

      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text(item['name']),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item['image'], height: 150, fit: BoxFit.cover),
                SizedBox(height: 10),
                Text("Includes: ${item['description']}",
                    style: TextStyle(fontSize: 15)),
                SizedBox(height: 10),
                item['customization'] == ""
                    ? Text("No Customization")
                    : Text(
                        "Customization: ${item['customization']}",
                        style: TextStyle(fontSize: 15),
                      ),
                SizedBox(height: 10),
                Text("Each Price: ${item['Each Price']}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity: ${item['Quantity']}",
                        style: TextStyle(fontSize: 15)),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.red),
                          onPressed: () {
                            if (item['Quantity'] > 1) {
                              setState(() {
                                item['Quantity']--;
                              });
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              item['Quantity']++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  ElevatedButton(
                    onPressed: () {
                      final updatedItem = {
                        ...item,
                        'quantity': item['Quantity'],
                        // 'totalPrice': item['Quantity'] * item['Each Price'],
                      };
                      cartBox.putAt(index, updatedItem); // Update the item
                      Navigator.pop(context); // Close the dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['name']} updated")),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartBox.deleteAt(index); // Remove the item
                      Navigator.pop(context); // Close the dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['name']} removed from cart")),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("Remove"),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("Close"),
              ),
            ],
          ),
        ),
      );
    }

    void confirmOrder(BuildContext context) {
      final addressController = TextEditingController();
      final phoneController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Confirm Order"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    hintText: "Enter your delivery address",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter your contact number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (addressController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  Navigator.pop(context); // Close the dialog
                  cartBox.clear(); // Clear the cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Order confirmed! Your order cannot be canceled."),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please provide address and phone number."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Confirm"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple.shade200),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              leading: Image.asset(item['image'],
                                  width: 50, fit: BoxFit.cover),
                              title: Text(item['name']),
                              subtitle: Text("Includes: ${item['description']}"),
                              trailing: IconButton(
                                icon: Icon(Icons.menu,
                                    color: Colors.purple.shade300),
                                onPressed: () {
                                  showItemDetails(context, item, index);
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (cartItems.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Your cart is empty!"),
                          ),
                        );
                      } else {
                        confirmOrder(context);
                      }
                    },
                    child: Text("Confirm Order"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
