import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../domain/home_repository.dart';
import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repository = HomeRepository();
  ProductModel? productmodelresponse;

  List<ProductModel> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';
  List<ProductModel> _cartItems = []; // List to store items added to cart

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<ProductModel> get cartItems => _cartItems; // Expose cart items

  Future<void> fetchProducts({Map<String, dynamic>? params}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final productmodelresponse = await _repository.getProduct(params: params);
      if (productmodelresponse != null && productmodelresponse is List) {
        _products = productmodelresponse.map((product) => ProductModel.fromMap(product)).toList();
      } else {
        _errorMessage = 'No products found.';
      }
    } catch (e) {
      log("Error fetching products: ${e.toString()}");
      _errorMessage = 'Error fetching products: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    notifyListeners(); // Notify listeners to update UI
  }

  void _onItemTapped(int index) {
    if (index < _products.length) {
      addToCart(_products[index]); // Add selected product to cart
      log('Added ${_products[index].title} to cart');
    }
  }
  void onItemTapped(int index) {
    _onItemTapped(index);
  }
}
