import 'dart:io';
import 'package:blood/Component/My_text_form_field.dart';
import 'package:blood/Component/myButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  List<Map<String, dynamic>>? list;
  EditProfile({super.key, this.list});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String Blood_Group;
  late String username;
  late String location;
  late String my_email;
  late String my_phone;
  var imageurl;
  Reference? refstorage;
  bool obscure_Text = true;
  File? file;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Updatedata() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "username": username,
        "email": my_email,
        "Blood_Group": Blood_Group,
        "phone": my_phone,
        "location": location,
        "imageURL": imageurl
      }).then((value) {
        print("data Update");
      }).catchError((e) {
        print(e);
      });
    } else {
      print("not valid");
    }
  }

  @override
  void initState() {
    if (widget.list != null && widget.list!.isNotEmpty) {
      my_email = widget.list!.first["email"];
      username = widget.list!.first["username"];
      my_phone = widget.list!.first["phone"];
      Blood_Group = widget.list!.first["Blood_Group"];
      location = widget.list!.first["location"];
      if (widget.list != null && widget.list!.first["imageURL"] != null) {
        imageurl = widget.list!.first["imageURL"];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Edit Profile",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image.network(
                    widget.list != null &&
                            widget.list!.first["imageURL"] != null
                        ? "${widget.list!.first['imageURL']}"
                        : "https://img.freepik.com/premium-vector/young-business-man-office-worker-avatar-face-icon-flat-style_768258-3459.jpg",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      top: 80,
                      left: 85,
                      child: IconButton(
                          onPressed: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    height: 170,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "Please Choose Image",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 30,
                                              ),
                                              TextButton(
                                                  onPressed: () async {
                                                    var _picker = ImagePicker();
                                                    var pickedFile =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);

                                                    if (pickedFile != null) {
                                                      file =
                                                          File(pickedFile.path);
                                                      // ignore: unused_local_variable
                                                      var nameimage = basename(
                                                          pickedFile.path);
                                                      refstorage = FirebaseStorage
                                                          .instance
                                                          .ref(
                                                              "images/${nameimage}");
                                                      await refstorage!
                                                          .putFile(file!);
                                                      imageurl =
                                                          await refstorage!
                                                              .getDownloadURL();
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "From Gallery",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.camera,
                                                size: 30,
                                              ),
                                              TextButton(
                                                  onPressed: () async {
                                                    var _picker = ImagePicker();
                                                    var pickedFile =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .camera);

                                                    if (pickedFile != null) {
                                                      file =
                                                          File(pickedFile.path);

                                                      var nameimage = basename(
                                                          pickedFile.path);
                                                      refstorage = FirebaseStorage
                                                          .instance
                                                          .ref(
                                                              "images/${nameimage}");
                                                      await refstorage!
                                                          .putFile(file!);
                                                      imageurl =
                                                          await refstorage!
                                                              .getDownloadURL();
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "From Camera",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Icons.photo_camera)))
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 500,
                  width: double.infinity,
                  child: Form(
                    key: formstate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyTextFormField(
                          initValue: widget.list!.first["username"],
                          name: "UserName",
                          icon: Icons.person_outline,
                          obscure_Text: false,
                          Save: (value) {
                            username = value!;
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
                          initValue: widget.list!.first["email"],
                          name: "Email",
                          icon: Icons.email_outlined,
                          obscure_Text: false,
                          Save: (value) {
                            my_email = value!;
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
                          initValue: widget.list!.first["phone"],
                          keyBoard: TextInputType.phone,
                          name: "Phone",
                          icon: Icons.phone,
                          obscure_Text: false,
                          Save: (value) {
                            my_phone = value!;
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
                                    child:
                                        Image.asset("images/BloodGroup.png")),
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
                                    items: [
                                      'Adrar',
                                      'Aïn-Defla',
                                      'Aïn-Témouchent',
                                      'Alger',
                                      'Annaba',
                                      'Batna',
                                      'Béchar',
                                      'Béjaïa',
                                      'Biskra',
                                      'Blida',
                                      'Bordj-Bou-Arreridj',
                                      'Bouira',
                                      'Boumerdès',
                                      'Chlef',
                                      'Constantine',
                                      'Djelfa',
                                      'El-Bayadh',
                                      'El-Oued',
                                      'El-Taref',
                                      'Ghardaia',
                                      'Guelma',
                                      'Illizi',
                                      'Jijel',
                                      'Khenchela',
                                      'Laghouat',
                                      'M\'Sila',
                                      'Mascara',
                                      'Médéa',
                                      'Mila',
                                      'Mostaganem',
                                      'Naâma',
                                      'Oran',
                                      'Ouargla',
                                      'Oum-El-Bouaghi',
                                      'Relizane',
                                      'Saida',
                                      'Sétif',
                                      'Sidi-Bel-Abbès',
                                      'Skikda',
                                      'Souk-Ahras',
                                      'Tamanrasset',
                                      'Tébessa',
                                      'Tiaret',
                                      'Tindouf',
                                      'Tipaza',
                                      'Tissemsilt',
                                      'Tizi-Ouzou',
                                      'Tlemcen'
                                    ]
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
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90),
                          child: myButton(
                            background_Color: Theme.of(context).primaryColor,
                            font_Size: 22,
                            function: () async {
                              Updatedata();
                              if (widget.list != null &&
                                  widget.list!.isNotEmpty) {
                                widget.list!.first["email"] = my_email;
                                widget.list!.first["username"] = username;
                                widget.list!.first["phone"] = my_phone;
                                widget.list!.first["Blood_Group"] = Blood_Group;
                                location = widget.list!.first["location"];
                                if (widget.list != null &&
                                    widget.list!.first["imageURL"] != null) {
                                  imageurl = widget.list!.first["imageURL"];
                                }
                              }
                              Navigator.of(context).pop();
                            },
                            name: "Save",
                            text_color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
