import 'package:flutter/material.dart';
import 'package:news_app_api/models/category_model.dart';
import 'package:news_app_api/services/data.dart';
import 'package:news_app_api/widgets/category_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories(); //assign all list of categories saved in getCategories
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
          ],
        ),
      ),

      //---End of body---//

    );
  }
}