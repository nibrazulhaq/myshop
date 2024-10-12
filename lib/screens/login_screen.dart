import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration_screen.dart'; // Import your RegistrationScreen

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
      ),
      body:SingleChildScrollView(
        child:Padding(
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
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock), // Prefix icon for password
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dashboard');
                  // Handle login action here (e.g., validate and authenticate)
                },
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
                  foregroundColor: Colors.black
                  , backgroundColor: Colors.white, // Set text and icon color to black
                  side: BorderSide(color: Colors.grey), // Add border color
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed('/registration'); // Navigate to the registration screen
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
