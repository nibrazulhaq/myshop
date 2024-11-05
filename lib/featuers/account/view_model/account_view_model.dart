// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/app_config/shared_preferences_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/account_repository.dart';
import '../model/login_model.dart';

class AccountViewModel with ChangeNotifier {
  final prefs = SharedPreferencesService();

  // Check Internet connectivity
  Future<bool> checkInternet() async {
    log("Checking internet connectivity");
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  // Loading states
  bool loginLoading = false;
  bool loginObscurePassword = true;

  // Controllers for text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  // Toggle password visibility
  void switchLoginPasswordObscure() {
    loginObscurePassword = !loginObscurePassword;
    notifyListeners();
  }

  // Validate email and password inputs
  bool validateInputs() {
    if (emailController.text.isEmpty) {
      errorMessage = 'Please enter your email';
      notifyListeners(); // Notify listeners for UI updates
      return false;
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'Please enter your password';
      notifyListeners(); // Notify listeners for UI updates
      return false;
    }
    errorMessage = null; // Clear error message if inputs are valid
    return true;
  }

  // Function to handle login
  Future<void> login() async {
    log('Email: ${emailController.text}');
    log('Password: ${passwordController.text}');

    loginLoading = true;
    errorMessage = null; // Clear previous error messages
    notifyListeners(); // Notify listeners to update loading state

    try {
      // Validate inputs before attempting login
      if (!validateInputs()) return;

      // Perform the login and get the response
      final response = await AccountRepository().login(params: {
        'username': emailController.text,
        'password': passwordController.text,
      });

      // Map response to LoginModel
      LoginModel? loginResponse = LoginModel.fromMap(response);

      if (loginResponse != null) {
        // Navigate to dashboard after successful login
        Get.toNamed('/dashboard');
      } else {
        errorMessage = 'Invalid login credentials';
      }
    } catch (e) {
      // Handle error, e.g., network issues
      errorMessage = 'Login failed, please try again';
      log('Login error: $e');
    } finally {
      loginLoading = false; // Stop loading indicator
      notifyListeners(); // Notify listeners to update loading state
    }
  }
}
