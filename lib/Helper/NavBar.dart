import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Screens/Cart.dart';
import '../Screens/Home.dart';
import '../Screens/Profile.dart';
import '../Screens/Search.dart';
import '../Screens/Tracker.dart';
import 'Theme.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pagelist = [
    HomePage(),
    SearchPage(),
    CartPage(),
    TrackerPage(),
    ProfilePage()
  ];
  Widget currentScreen = HomePage();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pagelist[currentTab],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //currentScreen = CartPage();
            currentTab = 2;
          });
        },
        child: Icon(
          Icons.shopping_cart_checkout_outlined,
        ),
        backgroundColor: currentTab == 2
            ? MyTheme().primaryColor
            : Color.fromARGB(255, 103, 218, 134),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              navButton(
                  currentTab: 0,
                  icon: const Icon(Icons.home_outlined),
                  tabName: 'Home'),
              navButton(
                  currentTab: 1,
                  icon: const Icon(Icons.search_outlined),
                  tabName: 'Search'),
              const SizedBox(
                width: 50,
              ),
              navButton(
                  currentTab: 3,
                  icon: const Icon(Icons.pin_drop_outlined),
                  tabName: 'Tracker'),
              navButton(
                  currentTab: 4,
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  tabName: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget navButton(
      {required int currentTab, required Icon icon, required String tabName}) {
    final bool isSelected = this.currentTab == currentTab;

    return MaterialButton(
      onPressed: () {
        setState(() {
          //currentScreen = HomePage();
          this.currentTab = currentTab;
        });
      },
      minWidth: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected ? MyTheme().primaryColor : Colors.grey,
            ),
            child: icon,
          ),
          Text(
            tabName,
            style: TextStyle(
              color: isSelected ? MyTheme().primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
