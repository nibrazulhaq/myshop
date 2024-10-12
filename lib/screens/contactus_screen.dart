import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  static const String id = '/contact-us'; // Define the route name

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture form data
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Submit form function
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Print form data for debugging
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Message: ${_messageController.text}');

      // Show confirmation dialog or send the form data to backend or email
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Contact Us'),
          content: Text('Your message has been submitted!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/contactus.png', // Path to the image in the assets folder
                fit: BoxFit.contain,  // Ensure the entire image is visible
                height: 300,          // Keep the height constraint if you want
                width: double.infinity,// BoxFit property to control how the image should be resized
              ),

              // Add a SizedBox to create space between the image and the text fields
              SizedBox(height: 32), // Adjust the height value as needed

              // Name TextField
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email TextField
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Message TextField
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  prefixIcon: Icon(Icons.message),
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
