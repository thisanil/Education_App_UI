import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/screens/profile_screen.dart';
import 'package:kk_studies/screens/test_screen.dart';

class Downloads extends StatefulWidget {
   Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  PageController controller=PageController();

  List<Widget> _list=<Widget>[
    const TestScreen(
      text: 'No File Available',
    ),
    const TestScreen(
      text: 'No File Available',
    ),

  ];

  final tabss=[
    'Videos',
    'Notes'
  ];

  int seletIndex=0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        title: Text('Downloads',style: TextStyle(color: textColor),),
        leading: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: textColor,),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    body: DefaultTabController(
      length: tabss.length!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          backgroundColor: Colors.transparent,
         appBar: PreferredSize(
           preferredSize: Size.fromHeight(45.h),
         child: TabBar(
           isScrollable: true,
           unselectedLabelColor: textColor,
           indicatorColor: Colors.transparent,
           indicatorSize: TabBarIndicatorSize.label,
           labelColor: textColor,
            indicatorWeight: .1,
            tabs: [
             InkWell(
               onTap: () {
                 controller.jumpToPage(0);
               },
               child: Tab(
                 child: Container(
                     padding: EdgeInsets.all(10),
                     alignment: Alignment.center,
                     height: 40.h,
                     width: 80.w,
                     decoration: BoxDecoration(
                         shape: BoxShape.rectangle,
                         border: Border.all(
                             color: seletIndex == 0
                                 ? textColor
                                 : Colors.transparent),
                         borderRadius: BorderRadius.circular(50.r),
                         color: Colors.white),
                     child: Text(tabss[0])),
               ),
             ),
             InkWell(
               onTap: () {
                 setState(() {
                   controller.jumpToPage(1);
                 });
               },
               child: Tab(
                 child: Container(
                     padding: EdgeInsets.all(10.h),
                     alignment: Alignment.center,
                     height: 40.h,
                     width: 80.w,
                     decoration: BoxDecoration(
                         shape: BoxShape.rectangle,
                         border: Border.all(
                             color: seletIndex == 1
                                 ? textColor
                                 : Colors.transparent),
                         borderRadius: BorderRadius.circular(50.r),
                         color: Colors.white),
                     child: Text(tabss[1])),
               ),
             ),
           ],
         ),
         //
          ),
          body: PageView(
            children: _list,
             controller: controller,
           onPageChanged: (num){
              setState(() {
                seletIndex=num;
              });
           },
          ),
        ),
      ),
    )

    );
  }
}
