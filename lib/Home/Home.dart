import 'package:blood/Home/Page/DonationRequest.dart';
import 'package:blood/Home/Page/HomePage.dart';
import 'package:blood/Home/Page/Profile.dart';
import 'package:blood/Home/Page/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Homepage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(width: 4, color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed("needrequest");
        },
        child: Image.asset("images/a.png"),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Homepage();
                        currentTab = 0;
                      });
                    },
                    child: Icon(
                      size: 30,
                      Icons.home_outlined,
                      color: currentTab == 0
                          ? Theme.of(context).primaryColor
                          : Color(0XFF7E7E7E),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Search();
                        currentTab = 1;
                      });
                    },
                    child: Icon(
                      size: 30,
                      Icons.search_outlined,
                      color: currentTab == 1
                          ? Theme.of(context).primaryColor
                          : Color(0XFF7E7E7E),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = DenationRequest();
                        currentTab = 3;
                      });
                    },
                    child: Container(
                      child: currentTab == 3
                          ? Image.asset("images/requestcolor.png")
                          : Image.asset("images/Request.png"),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 4;
                      });
                    },
                    child: Icon(
                      size: 30,
                      Icons.person_2_outlined,
                      color: currentTab == 4
                          ? Theme.of(context).primaryColor
                          : Color(0XFF7E7E7E),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
