import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'confirming_screen.dart'; // Import the ConfirmationScreen

class PaymentScreen extends StatefulWidget {
  static const String id = '/payment';

  final double totalAmount;
  final List<Map<String, dynamic>> cartItems; // Accept cart items
  final String shippingAddress; // Accept shipping address
  final String shippingCity; // Accept shipping city
  final String shippingPostalCode; // Accept shipping postal code

  PaymentScreen({
    required this.totalAmount,
    required this.cartItems,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingPostalCode,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';
  String cardHolderName = '';

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      // Simulate payment processing
      Get.snackbar(
        'Payment',
        'Your payment of \$${widget.totalAmount.toStringAsFixed(2)} is being processed!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // After payment is processed, navigate to the confirmation screen
      Get.to(() => ConfirmationScreen(
        cartItems: widget.cartItems,
        totalAmount: widget.totalAmount,
        shippingAddress: widget.shippingAddress,
        shippingCity: widget.shippingCity,
        shippingPostalCode: widget.shippingPostalCode,
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        expiryDate: expiryDate,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Icon(Icons.payment, color: Colors.blue, size: 30),
                      SizedBox(height: 4),
                      Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 4, indent: 8, endIndent: 8),
                  ),
                  Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 30),
                      SizedBox(height: 4),
                      Text('Confirm', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Card Image
              Center(
                child: Image.asset(
                  'assets/cardimage.png', // Update this with your actual card image path
                  height: 150,
                ),
              ),
              SizedBox(height: 16),

              // Total Amount Display
              Text(
                'Total Amount: \$${widget.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Payment Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Number Text Field
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Card Number'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 16) {
                          return 'Please enter a valid card number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),

                    // Expiry Date and CVV in the same row
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length != 5) {
                                return 'Please enter a valid expiry date';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                expiryDate = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'CVV'),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length != 3) {
                                return 'Please enter a valid CVV';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                cvv = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Cardholder Name Text Field
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Cardholder Name'),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the cardholder name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value;
                        });
                      },
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back Button
            ElevatedButton(
              onPressed: () {
                Get.back(); // Navigate back
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Back', style: TextStyle(color: Colors.white)),
            ),

            // Confirm Payment Button
            ElevatedButton(
              onPressed: _processPayment,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Center(
                child: Text('Confirm Payment', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
