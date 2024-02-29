class CartItemModel {
  String itemId;
  String imageurl;
  String itemName;
  String description;
  int price;
  int itemCount;

  CartItemModel({
    required this.itemId,
    required this.imageurl,
    required this.itemName,
    required this.description,
    required this.itemCount,
    required this.price,
  });
}
