import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kash/Helper/MenuItems.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Screens/Home.dart';
import 'package:page_transition/page_transition.dart';

import '../Helper/HomeBody.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot querysnapshot;
  DetailScreen({required this.querysnapshot});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // App bar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: HomePage(), type: PageTransitionType.rightToLeft));
          },
          color: Color(0xFF1A1A1A),
        ),
        backgroundColor: MyTheme().scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          widget.querysnapshot['name'],
          style: MyTheme().textTheme.headline3,
        ),
      ),
//
      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: MenuBody().menuTitles("Bestsellers"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: MenuBody().menuList(
                    context,
                    widget.querysnapshot.reference
                        .collection('Menu items')
                        .path
                        .toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
