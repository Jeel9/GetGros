import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kash/Helper/ProductCount.dart';
import 'package:kash/Helper/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kash/Service/RestaurantData.dart';
import 'package:provider/provider.dart';

////// CLASS FOR ALL HOME BODY WIDGETS //////

class MenuBody extends ChangeNotifier {
  //

  ///////   Title Widget for all   /////////

  Widget menuTitles(String homeTitle) {
    return Text(
      homeTitle,
      style: MyTheme().textTheme.headline3,
    );
  }

  ///
  ///   Restaurants List
  ///
  Widget menuList(BuildContext context, String collection) {
    return FutureBuilder(
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
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  //Image Container
                  Container(
                    height: 84,
                    width: 84,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // image: NetworkImage(
                        //   snapshot.data[index].data()['image'],
                        // ),
                        image: AssetImage("Assets/Images/Item1.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  //
                  // Body Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data[index].data()['name'],
                              style: MyTheme().textTheme.subtitle1,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              snapshot.data[index].data()['desp'],
                              style: MyTheme()
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: Color(0xFF8E8E93)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs. " +
                                  snapshot.data[index]
                                      .data()['price']
                                      .toString(),
                              style: MyTheme().textTheme.subtitle1,
                            ),
                            // Product counter widget
                            ProductCount(
                              itemId: snapshot.hashCode.toString(),
                              itemName: snapshot.data[index].data()['name'],
                              imageurl: "Assets/Images/Item1.png",
                              price: snapshot.data[index].data()['price'],
                              description: snapshot.data[index].data()['desp'],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
