import 'package:blood/Component/myButton.dart';
import 'package:flutter/material.dart';

class Auth_ extends StatelessWidget {
  const Auth_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/3.png"),
            SizedBox(
              height: 25,
            ),
            Image.asset("images/4.png"),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "You can donate for ones in need and request blood if you need.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Color(0XFF7E7E7E)),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            myButton(
                background_Color: Colors.white,
                font_Size: 22,
                function: () {
                  Navigator.of(context).pushReplacementNamed("login");
                },
                name: "Log In",
                text_color: Theme.of(context).primaryColor,
                padding_horizontal: 100),
            SizedBox(
              height: 10,
            ),
            myButton(
                background_Color: Theme.of(context).primaryColor,
                font_Size: 22,
                function: () {
                  Navigator.of(context).pushReplacementNamed("signup");
                },
                name: "Sign Up",
                text_color: Colors.white,
                padding_horizontal: 95),
          ],
        ),
      ),
    );
  }
}
