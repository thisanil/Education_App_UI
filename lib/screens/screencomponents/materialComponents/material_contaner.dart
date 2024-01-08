import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  const MaterialContainer({super.key, required this.pathImage, required this.text});
   final String pathImage,text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(pathImage,)),
            Text(text,style: TextStyle(color: Colors.black54,),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
