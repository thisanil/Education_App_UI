import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/commons/constants/constants.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  int _currentIndex=0;

  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      unselectedItemColor: Colors.black54,
      unselectedLabelStyle: TextStyle(color: Colors.black54,fontSize: 10),
      selectedLabelStyle:TextStyle(color: Colors.black54,fontSize: 12),
      showUnselectedLabels: true,
      iconSize: 28,
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:Color(0xFF265073),
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(AssetImage('assets/icons/test.png')),
          label: 'My Test',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/course.png')),
          label: 'My Course',
        ),BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/material.png')),
          label: 'Material',
        ),BottomNavigationBarItem(
          icon:ImageIcon(AssetImage('assets/icons/profile.png')),
          label: 'Profile',
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index){
        setState(() {
          _currentIndex=index;
        });
      },
    );
  }
}
