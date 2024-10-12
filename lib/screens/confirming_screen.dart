import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/thanq_you_screen.dart';
 // Import the ThankYouScreen

class ConfirmationScreen extends StatelessWidget {
  static const String id = '/confirmation';

  final List<Map<String, dynamic>> cartItems;
  final double totalAmount;
  final String shippingAddress;
  final String shippingCity;
  final String shippingPostalCode;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  ConfirmationScreen({
    required this.cartItems,
    required this.totalAmount,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingPostalCode,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Progress Tracker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.local_shipping, color: Colors.green, size: 30),
                    SizedBox(height: 4),
                    Text('Shipping', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Expanded(
                  child: Divider(color: Colors.green, thickness: 4, indent: 8, endIndent: 8),
                ),
                Column(
                  children: [
                    Icon(Icons.payment, color: Colors.green, size: 30),
                    SizedBox(height: 4),
                    Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Expanded(
                  child: Divider(color: Colors.green, thickness: 4, indent: 8, endIndent: 8),
                ),
                Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue, size: 30),
                    SizedBox(height: 4),
                    Text('Confirm', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Your Cart
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

            // Total Amount
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Shipping Address
            Text(
              'Shipping Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('$shippingAddress, $shippingCity, $shippingPostalCode'),
            SizedBox(height: 16),

            // Payment Method
            Text(
              'Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Cardholder Name: $cardHolderName'),
            Text('Card Number: **** **** **** ${cardNumber.substring(cardNumber.length - 4)}'),
            Text('Expiry Date: $expiryDate'),
            SizedBox(height: 16),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Generate a random tracking ID
                  String trackingId = DateTime.now().millisecondsSinceEpoch.toString();

                  // Navigate to Thank You screen
                  Get.to(() => ThankYouScreen(trackingId: trackingId));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Confirm Order', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
