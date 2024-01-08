import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HeaderTittle extends StatelessWidget {
  const HeaderTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Image.asset('assets/image/logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: defaultPadding/2),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("K K ",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900,color:textColor),),
              Text("STUDIES",style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontWeight: FontWeight.w900
                  ,color:textColor),),
            ],

          ),
        ),
      ],
    );
  }
}
