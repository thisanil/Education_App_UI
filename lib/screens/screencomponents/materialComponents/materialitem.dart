import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/screens/screencomponents/materialComponents/material_contaner.dart';

class MaterialItem extends StatelessWidget {
  const MaterialItem({super.key, required this.imagepath, required this.text, required this.line, required this.data});
 final String imagepath,text;
  final int line;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding/2),
      child: Container(
        height: line==4?300:160,
        child: GridView.count(
              physics:NeverScrollableScrollPhysics() ,
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            shrinkWrap: true,
            children:List.generate(line, (index) =>MaterialContainer(pathImage: imagepath, text: data[index]))
        ),
      ),
    );
  }
}
