import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kash/Helper/Headers.dart';
import 'package:kash/Helper/HomeBody.dart';
import 'package:kash/Helper/MenuItems.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Screens/Signup.dart';
import 'package:kash/Service/Authentication.dart';
import 'package:kash/Service/MapsData.dart';
import 'package:kash/Service/RestaurantData.dart';
import 'package:provider/provider.dart';
import 'Screens/Splash.dart';
import 'Service/CartItem_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: HomeBody()),
        ChangeNotifierProvider.value(value: RestaurantData()),
        ChangeNotifierProvider.value(value: GenerateMaps()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: MenuBody()),
        ChangeNotifierProvider.value(value: CartItemProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: MyTheme(),
        //home: Splash(),
        home: Signup(),
      ),
    );
  }
}
