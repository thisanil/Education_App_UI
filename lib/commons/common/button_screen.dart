import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/loginOP/login_screen.dart';
import 'package:kk_studies/screens/screencomponents/home_page.dart';

import '../../loginOP/firebase.dart';
import '../../screens/main_screen.dart';

class ButtonScreen extends StatefulWidget {
   ButtonScreen({super.key, this.height, this.width,  required this.email, required this.password});
   final double? height,width;
    String ? email,password;

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 350,
      child:ElevatedButton(

        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor:textColor,
                ),
        onPressed: () {},
        child: Text("login"),
      ) ,
    );
  }
}
