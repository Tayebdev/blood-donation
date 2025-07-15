import 'package:blood/Auth/Auth.dart';
import 'package:blood/Auth/Login.dart';
import 'package:blood/Auth/Reset%20Password.dart';
import 'package:blood/Auth/SignUp.dart';
import 'package:blood/Auth/Verify%20Screen.dart';
import 'package:blood/Donate/Donor.dart';
import 'package:blood/Donor/FindDonor.dart';
import 'package:blood/Home/Home.dart';
import 'package:blood/Home/Page/HomePage.dart';
import 'package:blood/Home/Page/Profile.dart';
import 'package:blood/Home/Page/Search.dart';
import 'package:blood/OrderBlood/OrderBlood.dart';
import 'package:blood/Report/report.dart';
import 'package:blood/Request/NeedRequest.dart';
import 'package:blood/Slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = await FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "auth": (context) => Auth_(),
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "ResetPassword": (context) => Reset_Password(),
        "VerifyScreen": (context) => Verify_Screen(),
        "home": (context) => Home(),
        "homepage": (context) => Homepage(),
        "needrequest": (context) => Need_Request(),
        "report": (context) => Report(),
        "FindDonor": (context) => Find_Donor(),
        "orderBlood": (context) => OrderBlood(),
        "donor": (context) => Donor(),
        "search": (context) => Search(),
        "profile": (context) => Profile()
      },
      theme: ThemeData(
        primaryColor: Color(0XFFFF2156),
        secondaryHeaderColor: Color(0XFFE0E0E0),
      ),
      //home: Test()
      home: islogin == false ? Slider_() : Home(),
    );
  }
}
