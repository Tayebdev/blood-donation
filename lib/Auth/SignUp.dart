import 'package:blood/Component/My_text_form_field.dart';
import 'package:blood/Component/myButton.dart';
import 'package:blood/Component/showLoading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood/Component/ListDonne%C3%A9.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserCredential? userCredential;
  var Blood_Group;
  var username;
  var location;
  var my_email;
  var my_password;
  var my_phone;
  bool obscure_Text = true;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  onSignUp() async {
    if (formstate.currentState!.validate() &&
        Blood_Group != null &&
        location != null) {
      formstate.currentState!.save();
      try {
        showdialog(context);
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: my_email,
          password: my_password,
        );
        return userCredential!;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
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
            SizedBox(height: 20),
            Image.asset("images/5.png"),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                  key: formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(
                        name: "UserName",
                        icon: Icons.person_outline,
                        obscure_Text: false,
                        Save: (value) {
                          username = value;
                        },
                        Valide: (value) {
                          if (value!.length > 100) {
                            return "Username can't to be large than 100 letter";
                          } else if (value.length < 10) {
                            return "Username can't to be less 10 letter";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(height: 15),
                      MyTextFormField(
                        keyBoard: TextInputType.phone,
                        name: "Phone",
                        icon: Icons.phone,
                        obscure_Text: false,
                        Save: (value) {
                          my_phone = value;
                        },
                        Valide: (value) {
                          if (value!.length != 10) {
                            return "is not number phone in algeria Country";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0XFFF0F2F3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                  flex: 1,
                                  child: Image.asset("images/BloodGroup.png")),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 10,
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("Blood Groupe"),
                                  items: [
                                    "A+",
                                    "A-",
                                    "B+",
                                    "B-",
                                    "AB+",
                                    "AB-",
                                    "O+",
                                    "O-"
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              "${e}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      this.Blood_Group = val.toString();
                                    });
                                  },
                                  value: this.Blood_Group,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 15),
                      Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0XFFF0F2F3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).primaryColor,
                                    size: 24,
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 10,
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("location"),
                                  items: listWilaya
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              "${e}",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      location = val.toString();
                                    });
                                  },
                                  value: location,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 10),
                      myButton(
                          background_Color: Theme.of(context).primaryColor,
                          font_Size: 22,
                          function: () async {
                            UserCredential? responce = await onSignUp();
                            if (responce != null) {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({
                                    "username": username,
                                    "email": my_email,
                                    "phone": my_phone,
                                    "Blood_Group": Blood_Group,
                                    "location": location
                                  })
                                  .then((value) => print("User Added"))
                                  .catchError((error) =>
                                      print("Failed to add user: $error"));
                              Navigator.of(context)
                                  .pushReplacementNamed("home");
                            }
                          },
                          name: "Sign Up",
                          text_color: Colors.white,
                          padding_horizontal: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF7E7E7E),
                                fontSize: 17),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("login");
                              },
                              child: Text(
                                "Log In",
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
