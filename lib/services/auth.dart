import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui_login/homepage.dart';
import 'package:ui_login/main.dart';
import 'package:ui_login/services/error_handler.dart';

class Auth {

  // Handle authentication from here


  handleAuth(){

    // Stream Builder is sometimes used when interacting with api
    // or 3rd party services
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return IndexPage();
        }else{
          return HomePage();
        }
      });
  }


  // Sign Out
  signOut(){
    FirebaseAuth.instance.signOut();
  }
  
  // Sign In

  signIn(String email, String password, context){
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print('signed In');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }


  // Sign Up Function

  signUp(String email, String password){
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

  }

}