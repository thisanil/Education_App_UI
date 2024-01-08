import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kk_studies/commons/constants/constants.dart';
import 'package:kk_studies/loginOP/signup_screen.dart';
import 'package:kk_studies/loginOP/textfield.dart';

import '../screens/main_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  sanckBar (String prm){
    final snackBar = SnackBar(
      content:  Text(prm,style: TextStyle(color: textColor),),
      backgroundColor: Color(0xFFE0F4FF),
      elevation: 3,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: defaultPadding*2,left: defaultPadding/2,right: defaultPadding/2),


    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  bool Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    return isvalid;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding*3.6),
              child: SizedBox(
                   height: 250,
                  width: 250,
                  child: Image.asset('assets/image/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
              child: Text("Email",style: TextStyle(fontSize: 18,),),
            ),
            CommonTextField(hinttext: "Enter email", controller: emailController,),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
              child: Text("Password",style: TextStyle(fontSize: 18,),),
            ),
            CommonTextField(hinttext: "Enter password", controller: passwordController,),
            Padding(
              padding: const EdgeInsets.only(left: 240),
              child: TextButton(onPressed: (){}, child:Text('Forget Password?',style: TextStyle(color: Colors.red),)),
            ),

           Padding(
             padding: const EdgeInsets.only(left: defaultPadding,top: defaultPadding),
             child:SizedBox(
               height: 40,
               width: 350,
               child:ElevatedButton(

                 style: ElevatedButton.styleFrom(
                   elevation: 3,
                   backgroundColor:textColor,
                 ),
                 onPressed: () {
                   signIn(email: emailController.text, password: passwordController.text);
                 },
                 child: Text("login"),
               ) ,
             )
           ),
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding*2,right: defaultPadding,left: defaultPadding),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 220,
                    child: OutlinedButton(
                      onPressed: () async {

                        try {
                          signInwithGoogle().then((value) {
                            sanckBar('Account Create Successfully');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
                          });
                          //
                        } catch(e){
                          if(e is FirebaseAuthException){
                            sanckBar(e.toString());
                          }
                        }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              height: 30,
                              width: 30,
                              child:Image.asset("assets/image/google.png")
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.black12,
                          ),
                          Text("Sign Up with Google",style: TextStyle(color: textColor,fontSize: 16),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor:textColor,
                        ),
                        child: Text("Sign Up")
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
  Future signIn({ String ? email, String ? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email??"", password: password??"").then((value) {
        if(value.user?.email==email){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
        }

      });
    } on FirebaseAuthException catch (e) {
       if(!Validate(email!)){
         sanckBar("Check Email");
       }
       else{
         sanckBar("User Don't Match");
       }

    }
  }
  Future signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
     sanckBar("Error ");
    }
  }

}
