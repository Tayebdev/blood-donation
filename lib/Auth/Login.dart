import 'package:blood/Component/My_text_form_field.dart';
import 'package:blood/Component/myButton.dart';
import 'package:blood/Component/showLoading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var my_email;
  var my_password;
  bool obscure_Text = true;
  UserCredential? userCredential;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  onLogIn() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      try {
        showdialog(context);
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: my_email, password: my_password);
        return userCredential!;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset("images/5.png"),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                  key: formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(
                        name: "Email",
                        icon: Icons.email_outlined,
                        obscure_Text: false,
                        Save: (value) {
                          my_email = value;
                        },
                        Valide: (value) {
                          if (value!.length > 100) {
                            return "Email can't to be large than 100 letter";
                          } else if (value.length < 10) {
                            return "Email can't to be less 10 letter";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      MyTextFormField(
                        name: "Password",
                        icon: Icons.lock,
                        suffix_icon: Icons.visibility_off,
                        Save: (value) {
                          my_password = value;
                        },
                        Valide: (value) {
                          if (value!.length > 20) {
                            return "Password can't to be large than 20 letter";
                          } else if (value.length < 4) {
                            return "Password can't to be less 4 letter";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      myButton(
                          background_Color: Theme.of(context).primaryColor,
                          font_Size: 22,
                          function: () async {
                            UserCredential? responce = await onLogIn();
                            if (responce != null) {
                              Navigator.of(context)
                                  .pushReplacementNamed("home");
                            }
                          },
                          name: "Log In",
                          text_color: Colors.white,
                          padding_horizontal: 100),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("ResetPassword");
                          },
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Roboto',
                            ),
                          )),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF7E7E7E),
                                fontSize: 17),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("signup");
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18),
                              ))
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
