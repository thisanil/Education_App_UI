import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kk_studies/screens/course.dart';
import 'package:kk_studies/screens/material.dart';
import 'package:kk_studies/screens/profile_screen.dart';
import 'package:kk_studies/screens/screencomponents/home_page.dart';

import 'package:kk_studies/screens/test_screen.dart';
import '../commons/common/header_action.dart';
import '../commons/constants/constants.dart';
import '../commons/header/header_tittle.dart';
import 'dart:io';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  User? user = FirebaseAuth.instance.currentUser;
  int _currentIndex = 0;
  final pages = [
    const HomePage(),
    const TestScreen(
      text: 'No Quizzes Available',
    ),
    const CourseScreen(),
    const MaterialScreen(),
    const ProfileScreen(),
  ];

  File? image;
  File? imageTemp;
  bool picked=false;

  Future pickImage(ImageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource);
      if(image == null) return;
      imageTemp = File(image.path);
      picked=true;
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: _currentIndex == 4
          ? AppBar(
              backgroundColor: Colors.white,
              leadingWidth: 300,
              toolbarHeight: 150,
              centerTitle: false,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 2),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                            radius: 45,
                            // backgroundImage:  NetworkImage(user!.photoURL!),
                            backgroundColor: Color(0xFFE0F4FF),
                            child: picked
                                ? Image.file(
                              image!,

                            )
                                : Container(
                            ),
                            ),
                        Positioned(
                          right: 0,
                          top: 55,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black12,
                            child: IconButton(
                                onPressed: () {
                                  showDialogBox();
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black54,
                                  size: 15.sp,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: defaultPadding * 1.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anil Saini",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: textColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "an011saini@gmail.com",
                            style: TextStyle(color: textColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "+918504960198",
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : AppBar(
              backgroundColor: Colors.white,
              leadingWidth: 200,
              toolbarHeight: 70,
              centerTitle: false,
              elevation: 0,
              leading: HeaderTittle(),
              actions: <Widget>[
                HeaderAction(path: 'assets/icons/search.gif'),
                HeaderAction(path: 'assets/icons/support.png'),
                HeaderAction(path: 'assets/icons/notification.png'),
                SizedBox(
                  width: defaultPadding / 2,
                )
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: TextStyle(color: Colors.black54, fontSize: 10),
        selectedLabelStyle: TextStyle(color: Colors.black54, fontSize: 12),
        showUnselectedLabels: true,
        iconSize: 28,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF265073),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/test.png')),
            label: 'My Test',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/course.png')),
            label: 'My Course',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/material.png')),
            label: 'Material',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/profile.png')),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }

  Future showDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Choose Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                   Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(
                      width: 15.h,
                    ),
                    Text('Gallery'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 15.h,
                    ),
                    Text('Camera'),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
