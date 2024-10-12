import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends StatefulWidget {
  static const String id = '/shipping_address';

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String phoneNumber = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String city = '';
  String postalCode = '';
  String country = 'United States'; // Default selected country

  // Sample country list (you can expand this list as needed)
  final List<String> countries = [
    'United States', // Moved to the start of the list
    'India', // Fixed the comma issue
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'Mexico',
    'Brazil',
    'South Africa',
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    fullName = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address Line 1',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    addressLine1 = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    addressLine2 = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    postalCode = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postal code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: country,
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    country = newValue!;
                  });
                },
                // Updated validation to ensure a selection
                validator: (value) {
                  if (value == null || value.isEmpty || !countries.contains(value)) {
                    return 'Please select a valid country';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String fullAddress = '''
                     $fullName
          $addressLine1, $addressLine2
$city, $postalCode, $country
Phone: $phoneNumber
                    ''';
                    Get.back(result: fullAddress); // Pass the address back
                  }
                },
                child: Text('Save Address'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
