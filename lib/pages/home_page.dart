import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/models/category_model.dart';
import 'package:news_app_api/models/slider_model.dart';
import 'package:news_app_api/services/data.dart';
import 'package:news_app_api/services/slider_data.dart';
import 'package:news_app_api/widgets/category_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];
  List<SliderModel> slider = [];

  @override
  void initState() {
    categories = getCategories(); //assign all list of categories saved in getCategories
    slider = getSliders(); //Called first
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //----- APPBAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('API',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      //---End of APPBAR

      //---body---//
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                    image: categories[index].image, //if index is zero takes first item that appears 
                    categoryName: categories[index].categoryName,
                  ).categoryTile();
                }),
            ),
            SizedBox(height: 30.0,),
            CarouselSlider.builder(
              itemCount: slider.length, 
              itemBuilder: (context, index, realIndex){
                String? res = slider[index].image;
                String? res1 = slider[index].name;
                return buildImage(res!, index, res1!);
              }, 
              options: CarouselOptions(
                height: 200, 
                enlargeCenterPage: true,
                autoPlay: true, 
                enlargeStrategy: CenterPageEnlargeStrategy.height, 
              ),
            ),
          ],
        ),

        //---End of body---//
      ),
    );
  }
  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width, 
        ),
    ),
  );
}