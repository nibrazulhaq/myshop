import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCouponScreen extends StatelessWidget {
  final List<Map<String, dynamic>> coupons = [
    {'code': 'DISCOUNT10', 'description': '10% off your purchase'},
    {'code': 'FREESHIP', 'description': 'Free Shipping on orders over \$50'},
    {'code': 'SAVE5', 'description': '\$5 off on orders over \$30'},
    // Add more coupons as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Coupons'),
      ),
      body: ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(coupons[index]['code']),
            subtitle: Text(coupons[index]['description']),
            trailing: ElevatedButton(
              onPressed: () {
                Get.back(result: coupons[index]['code']); // Pass back the selected coupon
              },
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}
