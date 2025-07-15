import 'package:blood/Component/MyText.dart';
import 'package:blood/OrderBlood/MyOrderBlood.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderBlood extends StatefulWidget {
  const OrderBlood({super.key});

  @override
  State<OrderBlood> createState() => _OrderBloodState();
}

class _OrderBloodState extends State<OrderBlood> {
  List<String> listBlood = [];
  int? Aplus;
  int? Bplus;
  int? Amoins;
  int? Bmoins;
  int? Oplus;
  int? Omoins;
  int? ABplus;
  int? ABmoins;
  getBlood() async {
    FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((ele) {
        setState(() {
          listBlood.add(ele.data()["Blood_Group"]);
          Aplus = listBlood.where((type) => type == 'A+').length;
          Amoins = listBlood.where((type) => type == 'A-').length;
          Bplus = listBlood.where((type) => type == 'B+').length;
          Bmoins = listBlood.where((type) => type == 'B-').length;
          ABplus = listBlood.where((type) => type == 'AB+').length;
          ABmoins = listBlood.where((type) => type == 'AB-').length;
          Oplus = listBlood.where((type) => type == 'O+').length;
          Omoins = listBlood.where((type) => type == 'O-').length;
        });
      });
    });
  }

  @override
  void initState() {
    getBlood();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Order Blood",
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
                    Navigator.of(context).pushReplacementNamed("home");
                  },
                  icon: Icon(Icons.arrow_back_ios))),
        ),
      ),
      body: listBlood.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Mytext(
                  text: "000${listBlood.length}",
                  size: 30,
                  fontWeight: FontWeight.bold,
                ),
                Mytext(
                  text: "Donor",
                  size: 35,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyOrderBlood(
                              number: "000${Oplus}",
                              type_blood: "O+",
                            ),
                            MyOrderBlood(
                              number: "000${Omoins}",
                              type_blood: "O-",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyOrderBlood(
                              number: "000${Aplus}",
                              type_blood: "A+",
                            ),
                            MyOrderBlood(
                              number: "000${Amoins}",
                              type_blood: "A-",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyOrderBlood(
                              number: "000${Bplus}",
                              type_blood: "B+",
                            ),
                            MyOrderBlood(
                              number: "000${Bmoins}",
                              type_blood: "B-",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyOrderBlood(
                              number: "000${ABplus}",
                              type_blood: "AB+",
                            ),
                            MyOrderBlood(
                              number: "000${ABmoins}",
                              type_blood: "AB-",
                            ),
                          ],
                        ),
                      ],
                    ),
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
