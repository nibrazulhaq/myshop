import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const String id = '/order-history';

  final List<Map<String, dynamic>> orders = [
    {
      'orderNumber': '12345',
      'date': '2024-09-25',
      'status': 'Delivered',
      'total': 45.99,
    },
    {
      'orderNumber': '54321',
      'date': '2024-08-15',
      'status': 'Cancelled',
      'total': 22.49,
    },
    {
      'orderNumber': '67890',
      'date': '2024-07-01',
      'status': 'Shipped',
      'total': 34.89,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Order #${order['orderNumber']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${order['date']}'),
                  Text('Status: ${order['status']}'),
                ],
              ),
              trailing: Text('\$${order['total'].toStringAsFixed(2)}'),
              onTap: () {
                // Handle order details navigation if needed
              },
            ),
          );
        },
      ),
    );
  }
}
