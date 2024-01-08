import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({super.key, required this.text, required this.icons});
  final String text;
  final Icon icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:13),
      child: Row(

        children: [
          Container(
            height: 35,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFFE0F4FF)
            ),
            child: Center(
              child: IconButton(onPressed: (){},
                icon:icons,

                color: Colors.black54,
                iconSize: 23,
              ),
            ),
          ),
          SizedBox(width: defaultPadding/2,),
          Expanded(child: Text(text,style: TextStyle(color: textColor,fontSize: 17),)),
          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 17,)
        ],
      ),
    );
  }
}
