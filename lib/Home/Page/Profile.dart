import 'package:blood/Component/MyDonate.dart';
import 'package:blood/Component/MyLIstTile.dart';
import 'package:blood/Component/MyText.dart';
import 'package:blood/Component/myButton.dart';
import 'package:blood/Home/EditProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool value = true;
  int? countDonate;
  int? countRequest;
  Map<String, dynamic>? data;
  List<Map<String, dynamic>> listdoc = [];

  Future<void> getdata() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        data = event.data();
        if (data != null) {
          listdoc.add(data!);
        }
      });
    });
  }

  Future<int> getDonate() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("Donor")
          .where("UID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      countDonate = querySnapshot.docs.length;

      setState(() {
        this.countDonate = countDonate;
      });
      return countDonate!;
    } catch (e) {
      print("Error: $e");
      return 0;
    }
  }

  Future<int> getRequest() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("request")
          .where("UID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      countRequest = querySnapshot.docs.length;

      setState(() {
        this.countRequest = countRequest;
      });
      return countRequest!;
    } catch (e) {
      print("Error: $e");
      return 0;
    }
  }

  @override
  void initState() {
    getRequest();
    getdata();
    getDonate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfile(
                          list: listdoc,
                        )));
              },
              icon: Icon(
                Icons.edit_outlined,
                size: 27,
              )),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0XFFF5F5F5)),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("home");
                  },
                  icon: Icon(Icons.arrow_back_ios))),
        ),
      ),
      body: (data != null && countDonate != null)
          ? Column(
              children: [
                Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      data != null && data!["imageURL"] != null
                          ? "${data!['imageURL']}"
                          : "https://img.freepik.com/premium-vector/young-business-man-office-worker-avatar-face-icon-flat-style_768258-3459.jpg",
                      fit: BoxFit.fill,
                    )),
                Mytext(
                    text: data != null ? "${data!['username']}" : "No data",
                    size: 30,
                    fontWeight: FontWeight.w500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    Mytext(
                      text: data != null ? "${data!['location']}" : "No data",
                      size: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFF7C7C7C),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(
                      function: () {
                        FlutterPhoneDirectCaller.callNumber(
                            "${data!['phone']}");
                      },
                      name: "Call",
                      background_Color: Color(0XFF689593),
                      text_color: Colors.white,
                      icon: Icons.call,
                      padding_horizontal: 15,
                      font_Size: 18,
                    ),
                    SizedBox(width: 30),
                    myButton(
                      function: () {},
                      name: "Request",
                      background_Color: Theme.of(context).primaryColor,
                      text_color: Colors.white,
                      icon: Icons.share,
                      font_Size: 18,
                      padding_horizontal: 0,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyDonate(
                          text_title: data != null
                              ? "${data!['Blood_Group']}"
                              : "No data",
                          name: "Blood Type"),
                      MyDonate(text_title: "0${countDonate}", name: "Donated"),
                      MyDonate(
                          text_title: "0${countRequest}", name: "Requested"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 374,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Mylisttile(
                        name: "Available for donate",
                        image: "images/AddFirend.png",
                        function: () {},
                        trailing: Switch(
                            inactiveThumbColor: Theme.of(context).primaryColor,
                            activeColor: Colors.white,
                            activeTrackColor: Theme.of(context).primaryColor,
                            inactiveTrackColor: Colors.white,
                            value: value,
                            onChanged: (val) {
                              setState(() {
                                value = val;
                              });
                            }),
                      ),
                      Mylisttile(
                        name: "Invite a friend",
                        image: "images/invite.png",
                        function: () {},
                      ),
                      Mylisttile(
                        name: "Get help",
                        image: "images/i.png",
                        function: () {},
                      ),
                      Mylisttile(
                        name: "Sign out",
                        image: "images/SignOut.png",
                        function: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacementNamed("login");
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
            ),
    );
  }
}
