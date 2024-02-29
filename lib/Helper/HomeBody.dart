import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kash/Screens/Detailscreen.dart';
import 'package:kash/Service/RestaurantData.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

////// CLASS FOR ALL HOME BODY WIDGETS //////

class HomeBody extends ChangeNotifier {
  //

  ///////   Title Widget for all   /////////

  Widget homeTitles(String homeTitle) {
    return Text(
      homeTitle,
      style: MyTheme().textTheme.headline3,
    );
  }

  Widget famousBrandsList(BuildContext context, String collection) {
    return SizedBox(
      height: 94,
      child: FutureBuilder(
        future: Provider.of<RestaurantData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            //padding: const EdgeInsets.only(left: 16),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            snapshot.data[index].data()['image'],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      snapshot.data[index].data()['name'],
                      style: MyTheme().textTheme.bodyText2,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  ///
  ///   Restaurants List
  ///
  Widget restaurantsList(BuildContext context, String collection) {
    return Container(
      height: 400,
      child: FutureBuilder(
        future: Provider.of<RestaurantData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            padding: const EdgeInsets.only(bottom: 16),
            itemBuilder: (BuildContext context, int index) {
              /// Each Card Container ///
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: DetailScreen(
                                querysnapshot: snapshot.data[index]),
                            type: PageTransitionType.rightToLeft));
                  },
                  // Card BG
                  child: Container(
                    height: 255,
                    decoration: BoxDecoration(
                      color: MyTheme().scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),

                    // Contents are in column
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image Container
                        Container(
                          height: 169,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                snapshot.data[index].data()['image'],
                              ),
                            ),
                          ),
                        ),

                        // Body Row
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 12, left: 12, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Name & category
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].data()['name'],
                                    style: MyTheme().textTheme.subtitle1,
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    snapshot.data[index].data()['category'],
                                    style: MyTheme().textTheme.caption,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),

                              // Rating & time
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 149, 0, 0.15),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 12.0),
                                      child: Text(
                                        snapshot.data[index].data()['rating'],
                                        style: MyTheme()
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                                color: MyTheme().hintColor),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    snapshot.data[index]
                                        .data()['delivery time']
                                        .toString(),
                                    style: MyTheme().textTheme.caption,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            height: 1,
                            color: MyTheme().backgroundColor,
                          ),
                        ),

                        // Discount
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("Assets/Icons/discount.svg"),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                snapshot.data[index].data()['discount'],
                                style: MyTheme()
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: MyTheme().primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
