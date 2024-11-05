import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/mycart_screen.dart';
import '../cart_service.dart';
import '../featuers/home/model/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  void addToCart(ProductModel product) {
    // Get the CartService instance
    final CartService cartService = Get.find<CartService>();

    // Add product to the cart
    cartService.addToCart({
      'name': product.title,
      'image': product.image,
      'price': product.price,
      'quantity': 1,
    });

    // Navigate to MyCartScreen
    Get.to(() => MyCartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Image.network(product.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => addToCart(product),
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
