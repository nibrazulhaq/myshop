import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/featuers/account/domain/account_repository.dart';
import 'package:my_shop/featuers/account/model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  bool _isPasswordVisible =
      false; // State variable to toggle password visibility

  // Email and password validation
  bool _validateInputs() {
    if (_emailController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your email';
      });
      return false;
    } else if (_passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your password';
      });
      return false;
    }
    return true;
  }

  // Function to handle login
  LoginModel? loginResponse;
  login() async {
    log(_emailController.text);
    log(_passwordController.text);
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Clear previous error messages
    });
    try {
      // Perform the login and get the response
      loginResponse = LoginModel.fromMap(
        await AccountRepository().login(params: {
          'username': _emailController.text,
          'password': _passwordController.text,
        }),
      );
      if (loginResponse != null) {
        // Navigate to dashboard after successful login
        Get.toNamed('/dashboard');
      } else {
        setState(() {
          _errorMessage = 'Invalid login credentials';
        });
      }
    } catch (e) {
      // Handle error, e.g., network issues
      setState(() {
        _errorMessage = 'Login failed, please try again';
      });
    } finally {
      setState(() {
        _isLoading = false; // Stop loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/log.png',
                width: 300,
                height: 300,
              ),
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    // Eye icon to toggle password visibility
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  errorText: _errorMessage == 'Please enter your password' ||
                          _errorMessage == 'Invalid login credentials'
                      ? _errorMessage
                      : null,
                ),
                obscureText:
                    !_isPasswordVisible, // Toggle obscureText based on _isPasswordVisible
              ),

              SizedBox(height: 20),
              _isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator()) // Show loading indicator when waiting for API
                  : ElevatedButton(
                      onPressed: (){Get.toNamed('/dashboard');},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text('Login'),
                    ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 10),
              // Sign up with Google button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Sign In
                },
                icon: Image.asset(
                  'assets/google.png', // Google icon path
                  height: 24,
                  width: 24,
                ),
                label: Text('Sign up with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor:
                      Colors.white, // Set text and icon color to black
                  side: BorderSide(color: Colors.grey), // Add border color
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(
                      '/registration'); // Navigate to the registration screen
                },
                child: Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
