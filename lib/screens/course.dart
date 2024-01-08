import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/screens/test_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  // int _currentIndex=0;
  int seletIndex = 0;

  setindex(int index) {
    setState(() {
      seletIndex = index;
    });
  }

  final pages = [
    const TestScreen(
      text: 'No Course Purchase',
    ),
    const TestScreen(
      text: 'No Class Scheduled Today',
    ),
    const TestScreen(
      text: 'No Upcoming Class  Scheduled',
    ),
  ];

  final tabss = [
    'My Course',
    'Live Classes',
    'Upcoming Classes',
  ];
  Color color = textColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabss.length!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45),
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: textColor,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: textColor,
                indicatorWeight: 5,
                tabs: [
                  InkWell(
                    onTap: () {
                      setindex(0);
                    },
                    child: Tab(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 40.h,
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
                      setindex(1);
                    },
                    child: Tab(
                      child: Container(
                          padding: EdgeInsets.all(10.h),
                          alignment: Alignment.center,
                          height: 40.h,
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
                  InkWell(
                    onTap: () {
                      setindex(2);
                    },
                    child: Tab(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 40.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: seletIndex == 2
                                      ? textColor
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.white),
                          child: Text(tabss[2])),
                    ),
                  ),
                ]),
          ),
          body: pages[seletIndex],
        ),
      ),
    );
  }
}
