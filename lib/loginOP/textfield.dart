import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commons/constants/constants.dart';

class CommonTextField extends StatelessWidget {
   CommonTextField({super.key, required this.hinttext, this.color, this.reduis,  this.controller});
  final String hinttext;
  final Color? color;
   final double? reduis;
    TextEditingController ? controller;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding,bottom: defaultPadding
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2, color:color?? Colors.black38,
            ),
            borderRadius: BorderRadius.circular(reduis??10),

          ),
          hintText: "${hinttext}.....",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,color: color?? Colors.black38,

            ),
            borderRadius: BorderRadius.circular(reduis??10),
          ),

        ),
        cursorColor: Colors.black12,
      ),
    );
  }
}

