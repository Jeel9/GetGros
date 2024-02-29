import 'package:flutter/material.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Models/CartItem_model.dart';

import '../Helper/ProductCount.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // CartItemModel ct = CartItemModel(
  //     imageurl: "imageurl",
  //     itemName: "itemName",
  //     description: "description",
  //     itemCount: 2,
  //     price: 10);

  List<CartItemModel> cartList = [];

  double totalAmount = 0, grandTotal = 0, taxes = 0;

  @override
  void initState() {
    super.initState();

    //cartList = getCartItems();
    // cartList.add(ct);
    // cartList.add(ct);
    for (int i = 0; i < cartList.length; i++) {
      totalAmount += cartList[i].price * cartList[i].itemCount;
    }
    taxes = 0.05 * totalAmount;
    grandTotal = totalAmount + taxes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme().backgroundColor,
        title: Text("My Cart", style: MyTheme().textTheme.headline3),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1A1A1A),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ListView.builder(
              itemCount: cartList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      //Image Container
                      Container(
                        height: 84,
                        width: 84,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // image: NetworkImage(
                            //   snapshot.data[index].data()['image'],
                            // ),
                            image: AssetImage("Assets/Images/Item1.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      //
                      // Body Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  cartList[index].itemName,
                                  style: MyTheme().textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  cartList[index].description,
                                  style: MyTheme()
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Color(0xFF8E8E93)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs. " + cartList[index].price.toString(),
                                  style: MyTheme().textTheme.subtitle1,
                                ),
                                // Product counter widget
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (cartList[index].itemCount > 1) {
                                            cartList[index].itemCount--;
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    Text(
                                      cartList[index].itemCount.toString(),
                                      style: MyTheme().textTheme.subtitle1,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (cartList[index].itemCount < 10) {
                                            cartList[index].itemCount++;
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            //
            // Pricing Section
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: MyTheme().textTheme.subtitle1,
                    ),
                    Text(
                      "$totalAmount",
                      style: MyTheme().textTheme.subtitle1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Taxes",
                      style: MyTheme().textTheme.bodyText1,
                    ),
                    Text(
                      "$taxes",
                      style: MyTheme().textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grand Total",
                      style: MyTheme().textTheme.subtitle1,
                    ),
                    Text(
                      "$grandTotal",
                      style: MyTheme().textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
