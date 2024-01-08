import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/model/productexplore.dart';

import '../../commons/constants/constants.dart';
import '../course.dart';
import '../download.dart';

class ExploreItems extends StatelessWidget {
  const ExploreItems({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Downloads()));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,),
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: defaultPadding/2,),
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(product.image!)),
              SizedBox(height: defaultPadding/3,),
              Text(product.title!,style: TextStyle(fontSize: 12,color:Colors.black54 ),),

            ],
          )
      ),
    );
  }
}
