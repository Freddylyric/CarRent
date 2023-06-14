import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userRef = FirebaseFirestore.instance.collection('users').doc(user!.uid);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userRef.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userData['imageUrl'] ?? ''),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Email: ${userData['email']}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Phone: ${userData['phoneNumber']}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Member Since: ${_formatDate(userData['createdAt'])}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement edit profile functionality
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    return '${date.day}/${date.month}/${date.year}';
  }
}
