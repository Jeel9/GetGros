import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../Helper/Theme.dart';
import '../Screens/Signup.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: Signup(),
                    type: PageTransitionType.leftToRightWithFade));
          },
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF1A1A1A),
          ),
        ),
        backgroundColor: MyTheme().backgroundColor,
        elevation: 0,
        title: Text(
          "Terms of Use",
          style: MyTheme().textTheme.headline3,
        ),
      ),
    );
  }
}
