import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kash/Models/CartItem_model.dart';
import 'package:kash/Service/Authentication.dart';
import 'package:provider/provider.dart';

class CartItemProvider extends ChangeNotifier {
  void addCartItems({
    required String itemId,
    required String itemName,
    required String imageUrl,
    required String description,
    required int price,
    required int itemCount,
  }) async {
    await FirebaseFirestore.instance
        .collection("GlobalCartDB")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyCart")
        .doc(itemId)
        .set({
      "itemId": itemId,
      "itemName": itemName,
      "imageUrl": imageUrl,
      "description": description,
      "price": price,
      "itemCount": itemCount,
    });
  }

  List<CartItemModel> cartItemList = [];
  Authentication obj = Authentication();

  void getCartItemsfromDB() async {
    List<CartItemModel> tempList = [];
    QuerySnapshot cartItemSnapshot = await FirebaseFirestore.instance
        .collection("GlobalCartDB")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyCart")
        .get();

    cartItemSnapshot.docs.forEach((element) {
      CartItemModel cartItemModel = CartItemModel(
        itemId: element.get("itemId"),
        imageurl: element.get("imageurl"),
        itemName: element.get("itemName"),
        description: element.get("description"),
        itemCount: element.get("itemCount"),
        price: element.get("price"),
      );
      tempList.add(cartItemModel);
    });
    cartItemList = tempList;
    notifyListeners();
  }

  List<CartItemModel> getCartItemList() {
    return cartItemList;
  }
}
