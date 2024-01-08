import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/screens/screencomponents/scrollimage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class ScrollAnimation extends StatefulWidget {
   ScrollAnimation({super.key});

  @override
  State<ScrollAnimation> createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
   @override
   int myCurrentIndex=0;


    Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Container(
         child: Column(
           children: [

             CarouselSlider(
                   options: CarouselOptions(
                     autoPlay: true,
                     height: 210,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                     autoPlayInterval: Duration(seconds:8),
                     autoPlayCurve: Curves.fastOutSlowIn,
                       viewportFraction: 1,
                       pageSnapping: false,
                     enlargeCenterPage: true,
                     onPageChanged: (index,reason){
                       setState(() {
                         myCurrentIndex=index;
                       });
                     }
                   ),
                 items: [
                   ScrollImage(image: "assets/image/thumnail.jpg"),
                   ScrollImage(image: 'assets/image/4.jpg'),
                   ScrollImage(image:"assets/image/2.jpg" ),
                   ScrollImage(image: "assets/image/5.jpg"),

                 ],
               ),
             SizedBox(height: defaultPadding/2,),
             AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: 4,
                effect:ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 6,
                  spacing: 10,
                  activeDotColor: textColor,
                  paintStyle: PaintingStyle.fill
                ),
              ),
           ],
         ),
       ),
     );
  }
}
