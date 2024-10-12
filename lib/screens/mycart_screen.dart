import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/shippingaddress_screen.dart';
import 'checkout_screen.dart';
import 'mycoupon_screen.dart';  // Make sure to import your coupon screen

class MyCartScreen extends StatefulWidget {
  static const String id = '/my_cart';

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // Sample cart items data
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Tomato',
      'image': 'assets/tomato.png',
      'price': 2.5,
      'quantity': 1,
    },
    {
      'name': 'Apple',
      'image': 'assets/apple.png',
      'price': 3.0,
      'quantity': 2,
    },
  ];

  String couponCode = '';
  double discountAmount = 0.0;

  String? shippingAddress;
  String? shippingCity;
  String? shippingPostalCode;

  double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  double get totalAmount {
    return subtotal - discountAmount;
  }

  void _applyCoupon() {
    if (couponCode == 'DISCOUNT10') {
      setState(() {
        discountAmount = subtotal * 0.10;
      });
      Get.snackbar('Success', 'Coupon applied successfully!', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Invalid coupon code!', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _setShippingAddress() async {
    final result = await Get.to(() => ShippingAddressScreen());
    if (result != null) {
      setState(() {
        shippingAddress = result['address'];
        shippingCity = result['city'];
        shippingPostalCode = result['postalCode'];
      });
    }
  }

  Future<void> _setMyCouponScreen() async {
    final selectedCoupon = await Get.to(() => MyCouponScreen());

    if (selectedCoupon != null && selectedCoupon.isNotEmpty) {
      setState(() {
        couponCode = selectedCoupon;
      });
      Get.snackbar('Success', 'Coupon "$selectedCoupon" selected!', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'No coupon selected.', snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          cartItems[index]['image'],
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
                                cartItems[index]['name'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$${cartItems[index]['price'].toStringAsFixed(2)} x ${cartItems[index]['quantity']}',
                                style: TextStyle(fontSize: 14, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  cartItems[index]['quantity']--;
                                });
                              },
                            ),
                            Text(cartItems[index]['quantity'].toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cartItems[index]['quantity']++;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shippingAddress == null
                    ? ElevatedButton(
                  onPressed: _setShippingAddress,
                  child: Text('Set Shipping Address'),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address: $shippingAddress, $shippingCity, $shippingPostalCode',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _setShippingAddress,
                      child: Text('Edit Shipping Address'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Coupon Code',
                          border: OutlineInputBorder(),
                        ),
                        controller: TextEditingController(text: couponCode), // Autofill chosen coupon
                        onChanged: (value) {
                          setState(() {
                            couponCode = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _applyCoupon,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text('Apply'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _setMyCouponScreen,  // Button to select coupon from MyCouponScreen
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text('Select Coupon'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                Text('Discount: \$${discountAmount.toStringAsFixed(2)}'),
                Text('Total: \$${totalAmount.toStringAsFixed(2)}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => CheckoutScreen(
                cartItems: cartItems,
                subtotal: subtotal,
                discountAmount: discountAmount,
                totalAmount: totalAmount,
                shippingAddress: shippingAddress,
                shippingCity: shippingCity,
                shippingPostalCode: shippingPostalCode,
              ));
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
