import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/featuers/home/view_model/home_view_model.dart';
import 'package:my_shop/screens/productdetails_screen.dart';
import 'package:my_shop/screens/profileedit_screen.dart';
import 'package:my_shop/screens/settings_screen.dart';
import 'package:my_shop/screens/track_order_screen.dart';
import 'package:my_shop/screens/transactionhistory_screen.dart';
import 'package:provider/provider.dart';
import 'combooffer_screen.dart';
import 'contactus_screen.dart';
import 'mycart_screen.dart';
import 'orderhistory_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = '/dashboard';


  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((token) {
      print("Firebase Messaging Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title}");
      // Show a dialog or notification

    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchProducts();
  });
        }

  final List<Map<String, String>> fruits = [
    {'name': 'Apple', 'image': 'assets/images/apple.png'},
    {'name': 'Banana', 'image': 'assets/banana.png'},
    {'name': 'Cherry', 'image': 'assets/cherry.png'},
    {'name': 'Date', 'image': 'assets/date.png'},
    {'name': 'Elderberry', 'image': 'assets/elderberry.png'},
  ];

  final List<Map<String, dynamic>> freshProducts = [
    {
      'name': 'Tomato',
      'image': 'assets/tomato.png',
      'price': 5.00,
      'description': 'Fresh Tomatoes'
    },
    {
      'name': 'Potato',
      'image': 'assets/potato.png',
      'price': 3.50,
      'description': 'Organic Potatoes'
    },
    // Add more products as needed
  ];

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Categories Page')),
    Center(child: Text('Shop Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, home, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),
            title: Text('Dashboard'),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(() => MyCartScreen()); // Navigate to cart screen
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Get.toNamed('/notification');
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Get.toNamed('/search');
                },
              ),
              IconButton(
                icon: Icon(Icons.track_changes),
                onPressed: () {
                  Navigator.pushNamed(context,
                      TrackOrderScreen.id); // Navigate to Track Order Screen
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // Set a fixed height for the DrawerHeader
                    height: 200, // Adjust this height as necessary
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/profile.png', // Replace with your profile image path
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'John Doe', // Replace with user's name
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'john.doe@example.com', // Replace with user's email
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEditScreen()),
                            );
                          },
                          child: Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),
                  ...[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile Details'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Profile Details page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text('Contact Us'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context,
                            ContactUsScreen.id); // Navigate to Contact Us
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Order History'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,
                            OrderHistoryScreen.id); // Navigate to order history
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_offer),
                      title: Text('Combo Offers'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context,
                            ComboOfferScreen.id); // Navigate to Combo Offers
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('Transaction History'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            TransactionHistoryScreen
                                .id); // Navigate to Transaction History
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Home page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.policy),
                      title: Text('Refund Policy'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Refund Policy page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About Us'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to About Us page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text('Contact Us'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context,
                            ContactUsScreen.id); // Navigate to Contact Us
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.article),
                      title: Text('Terms and Conditions'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Terms and Conditions page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.pushNamed(context,
                            SettingsScreen.id); // Navigate to settings screen
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Sign Out'),
                      onTap: () {
                        Navigator.pop(context);
                        Get.offNamed('/login'); // Navigate to the login screen
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Best for Health',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Get up to save 30% off',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Action for Shop Now button
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: Text('Shop Now'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/cover.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Explore our fresh fruits:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fruits.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 120,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  fruits[index]['image']!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                fruits[index]['name']!,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Fresh Products Daily',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action for See All button
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
             home.isLoading
        ? Center(child: CircularProgressIndicator())  // Show loading indicator when waiting for API
                    :
                GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: home.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1 / 1.5,
                        ),
                        itemBuilder: (context, index) {
                          final product = home.products[index];

                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() =>
                                      ProductDetailScreen(product: product));
                                  home.onItemTapped(
                                      index); // Call your function to handle the tap
                                },
                                child: Card(
                                  elevation: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          home.products[index]
                                              .image, // Use image URL from the model
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                        child: Text(
                                          home.products[index].description
                                              .toString(), // Use description from the model
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    600
                                                ? 10
                                                : 12, // Responsive font size
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Text(
                                        '\$${home.products[index].price.toStringAsFixed(2)}', // Use price from the model
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              // Navigate to MyCart screen
                                              Get.toNamed(
                                                  '/mycart'); // Ensure that '/mycart' is correctly defined in your routing
                                            },
                                            child: Text('Add'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Review action
                                            },
                                            child: Text('Review'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(Icons.info, color: Colors.grey),
                                  onPressed: () {
                                    // Info icon action
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.green, // Color for selected item
            unselectedItemColor: Colors.grey, // Color for unselected items
            backgroundColor:
                Colors.blue, // Background color for BottomNavigationBar
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
