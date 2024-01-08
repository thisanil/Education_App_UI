

import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationHelper {

    final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;


  Future signUp({context,required String email,required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  Future signIn({ String ? email, String ? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email??"", password: password??"").then((value) {
        if(value.user?.email==email){
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainScreen()))

        }
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  Future signOut() async {
    await _auth.signOut();


  }
}