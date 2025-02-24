
import 'package:news_app_api/models/slider_model.dart';

List<SliderModel> getSliders() {
  
  List<SliderModel> slider = [];
  SliderModel sliderModel = new SliderModel();

  //Business
  sliderModel.image = "assets/images/business.jpg";
  sliderModel.name = "Business";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  //Entertainment
  sliderModel.image = "assets/images/entertainment.jpg";
  sliderModel.name = "Entertainment";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  //Sports
  sliderModel.image = "assets/images/sports.jpg";
  sliderModel.name = "Sports";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  //Science
  sliderModel.image = "assets/images/science.jpg";
  sliderModel.name = "Science";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  //Technology
  sliderModel.image = "assets/images/technology.jpg";
  sliderModel.name = "Technology";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  return slider;
}