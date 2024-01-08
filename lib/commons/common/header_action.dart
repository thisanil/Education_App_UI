import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ImageIcon(
            AssetImage(path),
            color: Colors.black54,
            size: defaultPadding
        ),
        SizedBox(width: defaultPadding/2,),
      ],
    );

  }
}
