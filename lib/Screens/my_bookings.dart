// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../models/car_model.dart';
// import 'login/authentication_functions.dart';
//
// class MyBookingsScreen extends StatefulWidget {
//   final List<Car> cart;
//   const MyBookingsScreen({Key? key, required this.cart}) : super(key: key);
//   @override
//   _MyBookingsScreenState createState() => _MyBookingsScreenState();
// }
//
// class _MyBookingsScreenState extends State<MyBookingsScreen> {
//   List<Car> _cartItems = [];
//   List<String> _cart = []; // List to store car IDs in the cart
//   List<String> _myBookings = [];
//
//   final _authFunctions = Get.put(AuthenticationFunctions());
//
//   // List to store user's booked car IDs
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchMyBookings();
//   }
//
//   void _fetchMyBookings() async {
//     final email = _authFunctions.firebaseUser?.email;
//     final currentUser = _authFunctions.firebaseUser;
//     // Fetch the user's booked car IDs from the database and update _myBookings
//     // Replace 'user_id' with the actual user ID
//     DocumentSnapshot<Map<String, dynamic>> userSnapshot =
//     await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid!).get();
//
//     setState(() {
//       _myBookings = List<String>.from(userSnapshot.data()?['myBookings'] ?? []);
//     });
//   }
//
//
//
//   void _removeFromCart(String carId) {
//     setState(() {
//       _cart.remove(carId);
//     });
//   }
//
//   void _checkout() async {
//     // Add the cars in the cart to the user's myBookings field in the database
//     // Replace 'user_id' with the actual user ID
//
//     // Fetch the user's document
//     DocumentReference userRef =
//     FirebaseFirestore.instance.collection('users').doc('user_id');
//
//     // Update the myBookings field
//     await userRef.update({
//       'myBookings': FieldValue.arrayUnion(_cart),
//     });
//
//     // Navigate to the checkout screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => CheckoutScreen(cart: _cart)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Bookings'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _myBookings.length,
//               itemBuilder: (context, index) {
//                 String carId = _myBookings[index];
//
//                 return ListTile(
//                   title: Text('Car ID: $carId'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => _removeFromCart(carId),
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _checkout,
//             child: Text('Checkout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CheckoutScreen extends StatelessWidget {
//   final List<String> cart;
//
//   const CheckoutScreen({required this.cart});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         children: [
//           Text('Cart:'),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: cart.length,
//             itemBuilder: (context, index) {
//               String carId = cart[index];
//
//               return ListTile(
//                 title: Text('Car ID: $carId'),
//               );
//             },
//           ),
//           // Implement your payment logic and UI here
//         ],
//       ),
//     );
//   }
// }
