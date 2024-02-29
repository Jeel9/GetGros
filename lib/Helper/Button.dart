import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Theme.dart';

GestureDetector primaryButton(
    BuildContext context, String labelString, void Function() transitionFunc) {
  return GestureDetector(
    onTap: transitionFunc,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyTheme().primaryColor,
      ),
      height: 56,
      width: 343,
      child: Center(
        child: Text(
          labelString,
          style: MyTheme().textTheme.bodyText1?.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}

GestureDetector textButton(
    BuildContext context, String labelString, void Function() transitionFunc) {
  return GestureDetector(
    onTap: transitionFunc,
    child: Text(
      labelString,
      style: MyTheme().textTheme.caption?.copyWith(
            color: MyTheme().primaryColor,
          ),
    ),
  );
}
