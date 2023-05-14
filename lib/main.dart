import 'package:agro_empire/screens/product.dart';
import 'package:agro_empire/screens/profile.dart';
import 'package:agro_empire/screens/services.dart';
import 'package:flutter/material.dart';
import 'package:agro_empire/screens/login.dart';
import 'package:agro_empire/screens/signup.dart';
import 'package:agro_empire/screens/home.dart';
import 'package:agro_empire/screens/welcomeUser.dart';
import 'package:agro_empire/screens/direct_team.dart';
import 'package:agro_empire/screens/indirect_team.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context)=>  Home(),
      'login': (context)=>  MyLogin(),
      'signup': (context)=> MySignup(),
      'Userpage': (context)=> Userpage(),
      'DirectTeam': (context)=> DirectTeam(),
      'InDirectTeam': (context)=> InDirectTeam(),
      'Services': (context)=> Services(),
      'Product': (context)=> Product(),
      'Profile': (context)=> Profile(),
    },
  ));
}



