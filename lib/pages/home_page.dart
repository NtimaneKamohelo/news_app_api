import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/models/category_model.dart';
import 'package:news_app_api/models/slider_model.dart';
import 'package:news_app_api/services/data.dart';
import 'package:news_app_api/services/slider_data.dart';
import 'package:news_app_api/widgets/category_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];
  List<SliderModel> slider = [];

  int activeIndex = 0;

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
      body: SingleChildScrollView(
        child: Container(
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
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("View all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
                  height: 250, 
                  enlargeCenterPage: true,
                  autoPlay: true, 
                  enlargeStrategy: CenterPageEnlargeStrategy.height, 
                  onPageChanged: (index, reason){
                    setState(() {
                      activeIndex = index;
                    });
                  }
                ),
              ),
              SizedBox(height: 30,),
              Center(child: buildIndicator()),
              SizedBox(height: 30.0,),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending News",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("View all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Trending news
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                         child:  ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                           child: Image.asset(
                            "assets/images/technology.jpg", 
                            height: 150, width: 150, 
                            fit: BoxFit.cover,),
                         ),
                        ),
                        SizedBox(width: 8.0,),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: const Text("Deep seek takes over AI and plummets the US stock market",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: const Text("ChatGPT along with famous AI",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        
          //---End of body---//
        ),
      ),
    );
  }
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex, 
    count: slider.length,
    effect: const SlideEffect(
      dotWidth: 15, 
      dotHeight: 15, 
      activeDotColor: Colors.blue),
  );

  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, 
            ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            )
          ),
          child: Text(name, 
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 20.0, 
            fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );
}