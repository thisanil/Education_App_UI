import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk_studies/loginOP/textfield.dart';


import '../commons/constants/constants.dart';
import 'firebase.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _mobileController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool isLoader=false;
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
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding*4.7),
                child: SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/image/logo.png')),

              ),
              const Padding(
                padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
                child: const Text("Name",style: TextStyle(fontSize: 18,),),
              ),
              CommonTextField(hinttext: "Enter full name", controller: _nameController,),

              const Padding(
                padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
                child: const Text("Mobile Number",style: TextStyle(fontSize: 18,),),
              ),
              CommonTextField(hinttext: "Enter mobile number", controller: _mobileController,),


              const Padding(
                padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
                child: const Text("Email",style: TextStyle(fontSize: 18,),),
              ),
              CommonTextField(hinttext: "Enter email", controller: _emailController,),


             const Padding(
                padding: const EdgeInsets.only(left: defaultPadding,bottom: defaultPadding/2),
                child: const Text("Password",style: TextStyle(fontSize: 18,),),
              ),
              CommonTextField(hinttext: "Enter password", controller: _passwordController,),



              Padding(
                padding: const EdgeInsets.only(left: defaultPadding+3,top: defaultPadding),
                child: SizedBox(
                  height: 40,
                  width: 320,
                  child:ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor:textColor,
                    ),
                    onPressed: () {
                      if(!Validate(_emailController.text)){
                        sanckBar("Invalid Email ");
                      }
                      else{
                          setState(() {
                            isLoader=true;
                          });


                       AuthenticationHelper().signUp(email: _emailController.text, password: _passwordController.text).then((value) async {
                        setState(() {
                          isLoader=false;
                        });
                          storeData().then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                           sanckBar('Account Create Successfully');
                          });

                        });
                      }


                    },
                    child: isLoader? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                        :Text("Sign Up"),
                  ) ,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
 Future storeData()async{
    await FirebaseFirestore.instance.collection('Users').add({
      'full_name': _nameController.text, // John Doe
      'mobile_no': _mobileController.text, // Stokes and Sons

    });
  }
}
