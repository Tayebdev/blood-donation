import 'package:flutter/material.dart';

class Slider_ extends StatefulWidget {
  const Slider_({super.key});

  @override
  State<Slider_> createState() => _Slider_State();
}

class _Slider_State extends State<Slider_> {
  int val = 0;
  PageController cntrl = PageController(initialPage: 0);
  List list = [
    {
      "image": "images/1.png",
      "title": "Find Blood Donors",
      "description":
          "Find Blood Donors is likely a service or platform designed to connect people in need of blood donations with potential donors."
    },
    {
      "image": "images/2.png",
      "title": "Post A Blood Request",
      "description":
          "To publicly announce or share a need for blood donations, typically through online platforms in order to solicit blood donors for a specific patient or medical situation."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 600,
            child: PageView.builder(
              controller: cntrl,
              onPageChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              itemCount: list.length,
              itemBuilder: (context, item) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("${list[item]['image']}"),
                    SizedBox(height: 60),
                    Text(
                      "${list[item]['title']}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "${list[item]['description']}",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20, color: Color(0XFF7E7E7E)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(list.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == val) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == val)
                          ? Theme.of(context).primaryColor
                          : Color(0XFF7E7E7E),
                    ),
                  );
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (val == 1) {
                    cntrl.jumpToPage(0);
                  }
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, color: Color(0XFF7E7E7E)),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (val == 0) {
                    cntrl.jumpToPage(1);
                  } else if (val == 1) {
                    Navigator.of(context).pushReplacementNamed("auth");
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
