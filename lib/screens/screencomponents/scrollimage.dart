import 'package:flutter/material.dart';

class ScrollImage extends StatelessWidget {
  const ScrollImage({super.key, required this.image});
 final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image:AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
