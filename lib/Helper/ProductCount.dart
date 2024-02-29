import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kash/Service/CartItem_data.dart';
import 'package:provider/provider.dart';

import 'Theme.dart';

class ProductCount extends StatefulWidget {
  String itemId;
  String imageurl;
  String itemName;
  String description;
  int price;

  ProductCount({
    required this.itemId,
    required this.itemName,
    required this.description,
    required this.imageurl,
    required this.price,
  });

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int counter = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    //CartItemProvider cartItemProvider = Provider.of(context);
    return Container(
      child: isTrue == true
          ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (counter == 1) {
                        isTrue = false;
                      } else if (counter > 1) {
                        counter--;
                      }
                    });
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: MyTheme().primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "$counter",
                  style: MyTheme().textTheme.subtitle2,
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (counter < 10) {
                        counter++;
                      }
                    });
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: MyTheme().primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  isTrue = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFD3F8DD),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: Text(
                      "Add",
                      style: MyTheme()
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: MyTheme().primaryColor),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
