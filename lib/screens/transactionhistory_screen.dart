import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  static const String id = '/transaction-history';

  // Sample transaction data
  final List<Map<String, dynamic>> transactions = [
    {
      'transactionId': 'TX12345',
      'date': '2024-09-25',
      'status': 'Completed',
      'amount': 120.99,
    },
    {
      'transactionId': 'TX54321',
      'date': '2024-08-15',
      'status': 'Failed',
      'amount': 75.49,
    },
    {
      'transactionId': 'TX67890',
      'date': '2024-07-01',
      'status': 'Pending',
      'amount': 99.89,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Transaction #${transaction['transactionId']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${transaction['date']}'),
                  Text('Status: ${transaction['status']}'),
                ],
              ),
              trailing: Text('\$${transaction['amount'].toStringAsFixed(2)}'),
              onTap: () {
                // Handle transaction details navigation if needed
              },
            ),
          );
        },
      ),
    );
  }
}
