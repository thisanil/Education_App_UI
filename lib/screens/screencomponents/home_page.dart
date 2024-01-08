import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/model/productexplore.dart';
import 'package:kk_studies/screens/screencomponents/explore.dart';
import 'package:kk_studies/screens/screencomponents/scrollanimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ScrollAnimation(),

           Padding(
             padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding),
             child: Text("Explore",style: TextStyle(color: textColor,fontSize: 16),),

           ),

           Explore(),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding),
            child: Text("New Course",style: TextStyle(color: textColor,fontSize: 16),),
          ),
         Container(
           height: 180,
           child: ListView.builder(
             itemCount:5 ,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context,index){
             return Padding(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
               child:
               Container(
                 height: 180.h,
                 width: 170.w,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color:Colors.white
                 ),
                 child:
                 Container(
                    margin: EdgeInsets.only(bottom: defaultPadding*3.5),

                   height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage('assets/image/4.jpg'),
                      fit: BoxFit.cover

                    )
                   ),
                 ),


               ),
             );
           }),
         ),
          SizedBox(height: defaultPadding/2,),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding),
            child: Text("UPSC Course",style: TextStyle(color: textColor,fontSize: 16),),
          ),
          Container(
            height: 180,
            child: ListView.builder(
                itemCount:5 ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child:
                    Container(
                      height: 180,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:Colors.white
                      ),
                      child:
                      Container(
                        margin: EdgeInsets.only(bottom: defaultPadding*3.5),

                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage('assets/image/2.jpg'),
                                fit: BoxFit.cover

                            )
                        ),
                      ),


                    ),
                  );
                }),
          ),
          SizedBox(height: defaultPadding,)
        ],
      ),
    );
  }
}
