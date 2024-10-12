import 'package:flutter/material.dart';

class ComboOfferScreen extends StatelessWidget {
  static const String id = '/combo-offers'; // Define the route name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combo Offers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Combo Offer
            OfferContainer(
              imagePath: 'assets/combo1.png', // Example image path
              title: 'Fruits Offer',
              description: 'Get fresh fruits at a discounted price!',
              buttonText: 'Shop Now',
              onPressed: () {
                // Define action when this button is pressed
                print('Shop Now for Healthy Combo');
                // Navigate or perform an action here
              },
            ),
            SizedBox(height: 20),
            // Second Combo Offer
            OfferContainer(
              imagePath: 'assets/combo2.png', // Example image path
              title: 'Vegetables Offer',
              description: 'Special discounts on Vegetables',
              buttonText: 'Shop Now',
              onPressed: () {
                // Define action when this button is pressed
                print('Shop Now for Protein Pack Combo');
                // Navigate or perform an action here
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Offer Container Widget
class OfferContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  OfferContainer({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imagePath,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
