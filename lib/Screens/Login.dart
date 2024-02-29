import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kash/Helper/Button.dart';
import 'package:kash/Helper/NavBar.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Screens/Signup.dart';
import 'package:kash/Service/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Widget padbox = const SizedBox(
    height: 16,
  );
  Widget padbox2 = const SizedBox(
    height: 24,
  );

  //final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  String email = '', password = '';

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
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                padbox2,
                SizedBox(
                  height: 48,
                  width: 48,
                  child: SvgPicture.asset(
                    "Assets/Logo/Kash.svg",
                    color: MyTheme().primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Kash & Karry",
                  style: MyTheme()
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: MyTheme().primaryColor),
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Login Now',
                        style: MyTheme().textTheme.headline2)),
                padbox2,
                //textFieldBox("Name", nameController),
                //padbox,
                textFieldBox("Email", email),
                padbox,
                textFieldBox("Password", password),
              ],
            ),
            //padbox2,
            Column(
              children: [
                primaryButton(
                  context,
                  "Login",
                  () {
                    Provider.of<Authentication>(context, listen: false)
                        .loginInAccount(email, password);
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: NavBar(),
                            type: PageTransitionType.leftToRightWithFade));
                  },
                ),
                padbox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: MyTheme().textTheme.caption,
                    ),
                    textButton(
                      context,
                      "Create now",
                      () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Signup(),
                                type: PageTransitionType.leftToRightWithFade));
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField textFieldBox(String labelString, String inputName) {
    return TextField(
      onChanged: (value) {
        inputName = value;
      },
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
