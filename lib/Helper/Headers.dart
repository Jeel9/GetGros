// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Service/MapsData.dart';

class Headers extends ChangeNotifier {
  // AppBar
  Widget homeAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 44,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("Assets/Icons/location.svg"),
            const SizedBox(
              width: 8,
            ),
            Text(
              finalAddress,
              style: MyTheme().textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  // Categories
  Widget foodCategory(String typename) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyTheme().primaryColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              typename,
              style:
                  MyTheme().textTheme.bodyText2?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
