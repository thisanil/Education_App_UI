import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/model/productexplore.dart';

import 'exploreitem.dart';




class Explore extends StatelessWidget {
  const Explore({super.key, });
   
  @override
  Widget build(BuildContext context) {
    return Container(
      // you shoude need to add dependencien in your projct
      // go to pub.dev and add pluging
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: List.generate(9, (index) =>ExploreItems(product: demo_products[index],),
            ) )
        );






  }
}
