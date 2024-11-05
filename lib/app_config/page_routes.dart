
import 'package:get/get.dart';
import 'package:my_shop/screens/checkout_screen.dart';
import 'package:my_shop/screens/combooffer_screen.dart';
import 'package:my_shop/screens/confirming_screen.dart';
import 'package:my_shop/screens/contactus_screen.dart';
import 'package:my_shop/screens/mycart_screen.dart';
import 'package:my_shop/screens/orderhistory_screen.dart';
import 'package:my_shop/screens/payment_screen.dart';
import 'package:my_shop/screens/settings_screen.dart';
import 'package:my_shop/screens/start_screen.dart';
import 'package:my_shop/screens/track_order_screen.dart';
import '../../screens/registration_screen.dart';
import '../../screens/starting_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';


List<GetPage<dynamic>> getPages() {
  return [
    GetPage(
      name: '/registration',
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: '/starting',
      page: () => StartingScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(), // Add the LoginScreen route
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardScreen(), // Add the DashboardScreen route
    ),
    GetPage(
      name: '/start-guide',
      page: () => StartGuideScreen(),
    ),
    GetPage(
      name: '/my_cart',
      page: () => MyCartScreen(),
    ),
    GetPage(
      name: '/settings',
      page: () => SettingsScreen(),
    ),
    GetPage
      (name: ContactUsScreen.id,
        page: () => ContactUsScreen()
    ),
    GetPage(
        name: OrderHistoryScreen.id,
        page: () => OrderHistoryScreen()
    ),
    GetPage(
        name: TrackOrderScreen.id,
        page: () => TrackOrderScreen()
    ),

    GetPage(
        name: ComboOfferScreen.id,
        page: () => ComboOfferScreen()
    ),
    GetPage(
      name: CheckoutScreen.id,
      page: () => CheckoutScreen(
        cartItems: [], // Replace with actual cart items
        subtotal: 0.0, // Replace with actual subtotal
        discountAmount: 0.0, // Replace with actual discount
        totalAmount: 0.0, // Replace with actual total
        shippingAddress: '123 Main St', // Replace with actual address
        shippingCity: 'Springfield', // Replace with actual city
        shippingPostalCode: '62701', // Replace with actual postal code
      ),
    ),
    GetPage(
      name: '/PaymentScreen',
      page: () => PaymentScreen(
        cartItems: [], // This will be replaced when navigating from CheckoutScreen
        totalAmount: 0.0, // This will be replaced when navigating from CheckoutScreen
        shippingAddress: '', // This will be replaced when navigating from CheckoutScreen
        shippingCity: '', // This will be replaced when navigating from CheckoutScreen
        shippingPostalCode: '', // This will be replaced when navigating from CheckoutScreen
      ),
    ),
    GetPage(
      name: ConfirmationScreen.id,
      page: () => ConfirmationScreen(
        cartItems: [], // This will be replaced when navigating from PaymentScreen
        totalAmount: 0.0, // This will be replaced when navigating from PaymentScreen
        shippingAddress: '', // This will be replaced when navigating from PaymentScreen
        shippingCity: '', // This will be replaced when navigating from PaymentScreen
        shippingPostalCode: '', // This will be replaced when navigating from PaymentScreen
        cardNumber: '', // This will be replaced when navigating from PaymentScreen
        cardHolderName: '', // This will be replaced when navigating from PaymentScreen
        expiryDate: '', // This will be replaced when navigating from PaymentScreen
      ),
    ),
  ];
}
