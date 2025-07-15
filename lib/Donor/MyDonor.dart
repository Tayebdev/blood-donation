import 'package:blood/Component/myButton.dart';
import 'package:flutter/material.dart';
import 'package:blood/Component/MyText.dart';

// ignore: must_be_immutable
class MyDonor extends StatelessWidget {
  String? name;
  String? Blood_type;
  String? location;
  String? image;
  String? phone;
  String? city;
  String? hospital;
  String? nmbrDonate;
  MyDonor(
      {super.key,
      required this.name,
      required this.Blood_type,
      required this.location,
      required this.image,
      required this.hospital,
      required this.city,
      required this.phone,
      this.nmbrDonate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: false,
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 380,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -60,
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.network(
                            "${image}",
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    Positioned(
                        top: 70,
                        child: Column(
                          children: [
                            Mytext(
                              text: "${name}",
                              size: 22,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Mytext(
                                  text: "${location}",
                                  size: 14,
                                  color: Color(0XFF7E7E7E),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset("images/denate.png"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Mytext(
                                          text: "${nmbrDonate}",
                                          size: 16,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Mytext(
                                          text: " Times Donated",
                                          size: 16,
                                          color: Color(0XFF7E7E7E),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: 60),
                                Column(
                                  children: [
                                    Image.asset("images/bb.png"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Mytext(
                                          text: "Blood Type",
                                          size: 16,
                                          color: Color(0XFF7E7E7E),
                                        ),
                                        Mytext(
                                          text: " ${Blood_type}",
                                          size: 16,
                                          color: Theme.of(context).primaryColor,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myButton(
                                  function: () {},
                                  name: "Call",
                                  background_Color: Color(0XFF689593),
                                  text_color: Colors.white,
                                  icon: Icons.call,
                                  font_Size: 18,
                                ),
                                SizedBox(width: 15),
                                myButton(
                                  function: () {},
                                  name: "Request",
                                  background_Color:
                                      Theme.of(context).primaryColor,
                                  text_color: Colors.white,
                                  icon: Icons.call,
                                  padding_horizontal: 20,
                                  font_Size: 18,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 100,
                              width: 320,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Phone: ${phone}")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Loaction: ${city}")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text("${hospital}")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              );
            });
      },
      title: Container(
        height: 111,
        width: 374,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  "${image}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(top: 30, left: 300, child: Image.asset("images/B+.png")),
            Positioned(
                left: 305,
                top: 50,
                child: Mytext(
                  text: "${Blood_type}",
                  size: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )),
            Positioned(
                top: 25,
                left: 110,
                child: Mytext(
                  text: "${name}",
                  size: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
            Positioned(
                left: 110,
                top: 60,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    Mytext(
                      text: "${location}",
                      size: 18,
                      color: Color(0XFF7E7E7E),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
