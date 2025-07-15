import 'package:blood/Component/ListDonne%C3%A9.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blood/Component/My_text_form_field.dart';
import 'package:blood/Component/myButton.dart';

class Need_Request extends StatefulWidget {
  const Need_Request({super.key});

  @override
  State<Need_Request> createState() => _Need_RequestState();
}

class _Need_RequestState extends State<Need_Request> {
  var city;
  var hospital;
  var blood;
  var phone;
  bool valideData = false;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  CollectionReference RequestRef =
      FirebaseFirestore.instance.collection("request");
  Request() async {
    if (formstate.currentState!.validate() &&
        city != null &&
        hospital != null &&
        blood != null) {
      formstate.currentState!.save();
      valideData = true;
      RequestRef.add({
        "city": city,
        "hospital": hospital,
        "Blood_Group": blood,
        "phone": phone,
        "UID": FirebaseAuth.instance.currentUser!.uid,
      }).then((value) {
        print("Add Data");
      }).catchError((e) {
        print(e);
      });
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Create A Request",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0XFFF5F5F5)),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/3.png"),
                  SizedBox(height: 30),
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
                              hint: Text("City"),
                              items: listWilaya
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          "${e}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  city = val.toString();
                                });
                              },
                              value: city,
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
                                Icons.location_city,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              )),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 10,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Hospital"),
                              items: hospitalList
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          "${e}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  hospital = val.toString();
                                });
                              },
                              value: hospital,
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
                                  blood = val.toString();
                                });
                              },
                              value: blood,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 15),
                  MyTextFormField(
                    name: "Phone",
                    icon: Icons.phone,
                    obscure_Text: false,
                    Save: (value) {
                      phone = value;
                    },
                    Valide: (value) {
                      if (value!.length != 10) {
                        return "phone can't to be large than 10 number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
                    child: myButton(
                      background_Color: Theme.of(context).primaryColor,
                      font_Size: 22,
                      function: () {
                        Request();
                        if (valideData == true) {
                          Navigator.of(context).pushNamed("home");
                        }
                      },
                      name: "Send",
                      text_color: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
