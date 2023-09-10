import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  static Future<Map<String, dynamic>> getUserData(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return {}; // Return an empty map if user data doesn't exist
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching user data: $e');
      return {}; // Return an empty map in case of an error
    }
  }
}
