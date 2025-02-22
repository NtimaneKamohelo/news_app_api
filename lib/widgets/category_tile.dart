import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryTile {
   final image;
   final categoryName;

   CategoryTile({
    required this.image,
    required this.categoryName,
   });

   Container categoryTile() {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            image,
            width: 120,
            height: 60,
          )
        ],
      ),
    );

   }

}