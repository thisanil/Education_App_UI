import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/screens/screencomponents/materialComponents/materialitem.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  List daily=[
    "Daily \nCurrent Affairs",
    "Current Affairs"
  ];
  List newpaper=[
    "Daily Newspaper \nHighlight",
    "Newspaper Highlights"
  ];
  List writing=[
    "UPSC Answer Writing",
    "RAS Answer Writing",
    "MPPSC Answer Writing",
    "UPPSC Answer Writing",

  ];
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding/2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultPadding/2,),
          Text("Current Affairs",style: TextStyle(fontSize: 20,color: textColor),),
            MaterialItem(imagepath: "assets/material/daily.png", text: "Daily Current Affairs", line: 2, data:daily ,),
            Text("Newpaper Highlight",style: TextStyle(fontSize: 20,color: textColor),),
            MaterialItem(imagepath: "assets/material/newspaper.png", text: "Newpaper Highlight", line: 2, data: newpaper,),
            Text("Answer Writing",style: TextStyle(fontSize: 20,color: textColor),),
            MaterialItem(imagepath: "assets/material/contentwriting.png", text: "Answer Writing", line: 4, data: writing,),
            // SizedBox(height: defaultPadding/2,)
          ],
        ),
      ),
    );
  }
}


