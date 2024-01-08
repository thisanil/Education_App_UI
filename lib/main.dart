import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kk_studies/loginOP/login_screen.dart';
import 'package:kk_studies/screens/main_screen.dart';
import 'package:kk_studies/splash_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  User? user = FirebaseAuth.instance.currentUser;
  @override


  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:AnimatedSplashScreen(
          duration: 3000,
          splashIconSize: 350.spMax,
          splash:  Image.asset("assets/image/logo.png"),
            // pageTransitionType: PageTransitionType.scale,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen:user?.uid!=null?MainScreen():LoginScreen(),
      )
      );
    });
  }
}


//user?.uid!=null?MainScreen():LoginScreen()