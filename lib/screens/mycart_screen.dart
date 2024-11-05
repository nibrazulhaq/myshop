import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_service.dart';

class MyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartService cartService = Get.find<CartService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              cartService.clearCart();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (cartService.cartItems.isEmpty) {
          return Center(
            child: Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: cartService.cartItems.length,
          itemBuilder: (context, index) {
            final item = cartService.cartItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.network(
                      item['image'],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$${item['price'].toStringAsFixed(2)} x ${item['quantity']}',
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
