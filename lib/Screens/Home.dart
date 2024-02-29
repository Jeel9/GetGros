import 'package:flutter/material.dart';
import 'package:kash/Helper/Headers.dart';
import 'package:kash/Helper/HomeBody.dart';
import 'package:kash/Helper/NavBar.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:kash/Storage/category_data.dart';
import 'package:kash/Models/category_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../Service/MapsData.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> arr = <CategoryModel>[];

  @override
  void initState() {
    super.initState();
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();

    arr = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().backgroundColor,
      body: Column(
        children: [
          // Header Container
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Headers().homeAppBar(context),
                SizedBox(
                  height: 34,
                  //color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Headers().foodCategory(arr[index].categoryName);
                    },
                    padding: const EdgeInsets.only(left: 16),
                    itemCount: arr.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          // Header container Ends

          // Body Container
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    //
                    // Famous Brands Container//
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: HomeBody().homeTitles("Famous Brands"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: HomeBody()
                              .famousBrandsList(context, "famous brands"),
                        ),
                      ],
                    ), // Famous Brands Container ends here

                    // Restaurants list
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: HomeBody()
                              .homeTitles("Top Rated Places Near You"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: HomeBody()
                              .restaurantsList(context, "top restaurants"),
                        ),
                      ],
                    ),

                    ///Restaurants list ends here
                  ],
                ),
              ),
            ),
          ),

          /// Body Container ends here
        ],
      ),
    );
  }
}
