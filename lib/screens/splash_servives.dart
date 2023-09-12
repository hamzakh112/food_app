import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/login_screen.dart';

class SplashServices{
  void islogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 4),() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });

    }
    else{
      Timer(Duration(seconds: 2),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

      });
    }

  }
}