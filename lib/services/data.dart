import 'package:news_app_api/models/category_model.dart';

List<CategoryModel> getCategories() {
  
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  //Business
  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //Entertainment
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //Sports
  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //Science
  categoryModel.categoryName = "Science";
  categoryModel.image = "assets/images/science.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //Technology
  categoryModel.categoryName = "Technology";
  categoryModel.image = "assets/images/technology.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}