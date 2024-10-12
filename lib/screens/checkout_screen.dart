import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payment_screen.dart'; // Import the PaymentScreen

class CheckoutScreen extends StatelessWidget {
  static const String id = '/checkout';
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;
  final double discountAmount;
  final double totalAmount;
  final String? shippingAddress;
  final String? shippingCity;
  final String? shippingPostalCode;

  CheckoutScreen({
    required this.cartItems,
    required this.subtotal,
    required this.discountAmount,
    required this.totalAmount,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingPostalCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipping Address: $shippingAddress, $shippingCity, $shippingPostalCode'),
            SizedBox(height: 16),
            Text(
              'Your Cart:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(cartItems[index]['image'], height: 50, width: 50),
                    title: Text(cartItems[index]['name']),
                    subtitle: Text(
                      '\$${cartItems[index]['price'].toStringAsFixed(2)} x ${cartItems[index]['quantity']}',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
            Text('Discount: \$${discountAmount.toStringAsFixed(2)}'),
            Text('Total: \$${totalAmount.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the payment screen with all relevant details
                Get.to(() => PaymentScreen(
                  cartItems: cartItems,
                  totalAmount: totalAmount,
                  shippingAddress: shippingAddress ?? '',
                  shippingCity: shippingCity ?? '',
                  shippingPostalCode: shippingPostalCode ?? '',
                ));
              },
              child: Text('Proceed to Payment'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
