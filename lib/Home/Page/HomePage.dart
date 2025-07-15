import 'package:blood/Component/Button.dart';
import 'package:flutter/material.dart';
import 'package:blood/Component/MyText.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset("images/4.png"),
                SizedBox(width: 93),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                    ))
              ],
            ),
            Container(
              width: 374,
              height: 179,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "images/6.png",
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button_(
                    name: "Find Donors",
                    image: "images/78.png",
                    function: () {
                      Navigator.of(context).pushNamed("FindDonor");
                    }),
                Button_(
                    name: "Donates",
                    image: "images/77.png",
                    function: () {
                      Navigator.of(context).pushNamed("donor");
                    }),
                Button_(
                    name: "Order Bloods",
                    image: "images/79.png",
                    function: () {
                      Navigator.of(context).pushNamed("orderBlood");
                    })
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button_(
                    name: "Assistant", image: "images/80.png", function: () {}),
                Button_(
                    name: "Report",
                    image: "images/81.png",
                    function: () {
                      Navigator.of(context).pushNamed("report");
                    }),
                Button_(
                    name: "Campaign", image: "images/82.png", function: () {})
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Donation Request",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: 146,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: Stack(
                children: [
                  Positioned(
                      left: 310, top: 10, child: Image.asset("images/B+.png")),
                  Positioned(
                      left: 315,
                      top: 30,
                      child: Mytext(
                        text: "B+",
                        size: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  Positioned(
                      left: 10,
                      child: Mytext(
                        text: "Name",
                        size: 18,
                        color: Color(0XFF7E7E7E),
                      )),
                  Positioned(
                      top: 25,
                      left: 10,
                      child: Mytext(
                        text: "Tayeb Boulegzazel",
                        size: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  Positioned(
                      top: 50,
                      left: 10,
                      child: Mytext(
                        text: "Location",
                        size: 18,
                        color: Color(0XFF7E7E7E),
                      )),
                  Positioned(
                      top: 80,
                      left: 10,
                      child: Mytext(
                        text: "Setif AinMous",
                        size: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  Positioned(
                      top: 110,
                      left: 10,
                      child: Mytext(
                        text: "5 Min Ago",
                        size: 14,
                        color: Color(0XFF7E7E7E),
                      )),
                  Positioned(
                      top: 100,
                      left: 280,
                      child: Mytext(
                        text: "Donate",
                        size: 22,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
