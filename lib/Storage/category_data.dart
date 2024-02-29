import '../Models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> arr = <CategoryModel>[];

  CategoryModel foodtype = CategoryModel();

  foodtype.categoryName = "All";
  arr.add(foodtype);
  foodtype = CategoryModel();

  foodtype.categoryName = "Pizza";
  arr.add(foodtype);
  foodtype = CategoryModel();

  foodtype.categoryName = "Chinese";
  arr.add(foodtype);
  foodtype = CategoryModel();

  foodtype.categoryName = "North Indian";
  arr.add(foodtype);
  foodtype = CategoryModel();

  foodtype.categoryName = "South Indian";
  arr.add(foodtype);
  foodtype = CategoryModel();

  foodtype.categoryName = "Burgers";
  arr.add(foodtype);
  foodtype = CategoryModel();

  return arr;
}
