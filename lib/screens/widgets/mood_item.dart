import 'package:flutter/material.dart';
import 'package:moody/helper/apptheme.dart';
import 'package:moody/variables/util_variables.dart';

class MoodItem extends StatelessWidget {
  const MoodItem({super.key, required this.name, required this.image, required this.isSelected, required this.onTap, required this.emotions});

  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  final List<String> emotions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 118.o,
        width: 105.o,
        margin: EdgeInsets.all(8.o),
        decoration: BoxDecoration(border:isSelected? Border.all(width: 2.o,color: theme.orange):null,boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.05,
              offset: const Offset(1, 2),
              blurRadius: 8)
        ], color: Colors.white, borderRadius: BorderRadius.circular(50.o)),
        padding: EdgeInsets.all(8.o),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image), // Use the image from moodMap
            Text(
              name, // Display the mood name
              style: theme.primaryTextStyle.copyWith(fontSize: 14.o),
            ),

          ],
        ),
      ),
    );
    ;
  }
}
