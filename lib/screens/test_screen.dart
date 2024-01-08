import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../commons/constants/constants.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/icons/problem.png",
                      fit: BoxFit.cover,
                    )),
                Text(
                  text,
                  style: TextStyle(color: Colors.black54, fontSize: 22),
                ),
                Text(
                    "Looks like we didn't have anything that\n your are searching for.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
