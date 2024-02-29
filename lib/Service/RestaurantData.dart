import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RestaurantData extends ChangeNotifier {
  //create instance of firebasestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();

    return querySnapshot.docs;
  }
}
