import 'package:get/get.dart';

class CartService extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }

  void clearCart() {
    cartItems.clear();
  }
}
