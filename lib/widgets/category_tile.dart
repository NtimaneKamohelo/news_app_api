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
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black38,
            ),
            child: Center(
              child: Text(categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),),
            ),
          )
        ],
      ),
    );

   }

}