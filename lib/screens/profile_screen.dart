import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/loginOP/login_screen.dart';
import 'package:kk_studies/screens/screencomponents/profile_item.dart';

import 'download.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Divider(
            thickness: 1,
          ),
          SizedBox(height: defaultPadding/2,),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Downloads()));
              },
              child: ProfileItems(text: 'My Downloads', icons: Icon(Icons.file_download,size: 17,),)),
          ProfileItems(text: 'My Submissions', icons: Icon(Icons.file_download_done_outlined,size: 17),),
          ProfileItems(text: 'My Order', icons: Icon(Icons.shopping_cart_outlined,size: 17),),
          ProfileItems(text: "FAQ'S", icons: Icon(Icons.question_answer_outlined,size: 17),),
          ProfileItems(text: 'Terms & Conditions', icons: Icon(Icons.error_outline_outlined,size: 17),),
          ProfileItems(text: 'Share Application', icons: Icon(Icons.share,size: 17),),
          InkWell(child: ProfileItems(text: 'Logout', icons: Icon(Icons.logout_outlined,size: 17),),
          onTap: () async {

            await _auth.signOut().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            });

          },
          ),

          Padding(padding: EdgeInsets.only(top: defaultPadding*3,left: defaultPadding*5.8),
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Delete Account",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),),
                    ),
          )
        ],

        ),
      ),
    );
  }
}
