import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kash/Helper/Button.dart';
import 'package:kash/Helper/NavBar.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Miniscreens/Policy.dart';
import 'package:kash/Miniscreens/Terms.dart';
import 'package:kash/Screens/Login.dart';
import 'package:kash/Service/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  Widget padbox = const SizedBox(
    height: 16,
  );
  Widget padbox2 = const SizedBox(
    height: 24,
  );

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 224,
              width: 343,
              child: SvgPicture.asset("Assets/Icons/In no time-amico.svg"),
            ),
            padbox,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Create your account',
                              style: MyTheme().textTheme.headline2)),
                      padbox2,
                      //textFieldBox("Name", nameController),
                      //padbox,
                      textFieldBox("Email", emailController),
                      padbox,
                      textFieldBox("Password", passwordController),
                      padbox2,
                      Text(
                        'By signing up you are agreeing our',
                        style: MyTheme().textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textButton(
                            context,
                            "Terms of Use",
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: Terms(),
                                      type: PageTransitionType
                                          .leftToRightWithFade));
                            },
                          ),
                          Text(
                            ' and ',
                            style: MyTheme().textTheme.caption,
                          ),
                          textButton(
                            context,
                            "Privacy Policy",
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: PrivacyPolicy(),
                                      type: PageTransitionType
                                          .leftToRightWithFade));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  //padbox2,
                  Column(
                    children: [
                      primaryButton(
                        context,
                        "Sign Up",
                        () {
                          print(emailController.text + passwordController.text);
                          Provider.of<Authentication>(context, listen: false)
                              .createNewAccount(emailController.text,
                                  passwordController.text);
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: NavBar(),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                      ),
                      padbox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: MyTheme().textTheme.caption,
                          ),
                          textButton(
                            context,
                            "Login now",
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: Login(),
                                      type: PageTransitionType
                                          .leftToRightWithFade));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField textFieldBox(
      String labelString, TextEditingController controllerName) {
    return TextField(
      controller: controllerName,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MyTheme().backgroundColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MyTheme().primaryColor),
        ),
        filled: true,
        fillColor: MyTheme().backgroundColor,
        hintText: labelString,
        hintStyle: MyTheme().textTheme.bodyText1?.copyWith(color: Colors.grey),
      ),
    );
  }
}
