import 'package:blood/Component/myButton.dart';
import 'package:blood/Report/MyReport.dart';
import 'package:flutter/material.dart';
import 'package:blood/Component/MyText.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Report",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              Mytext(
                text: "Reseach Center",
                size: 16,
                fontWeight: FontWeight.normal,
                color: Color(0XFF7C7C7C),
              ),
            ],
          ),
          Mytext(
            text: "Dhaka Medical College, Dhaka.",
            size: 14,
            fontWeight: FontWeight.normal,
            color: Color(0XFF7C7C7C),
          ),
          SizedBox(height: 30),
          Image.asset("images/report.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyReport(
                type: "Glucose",
                value: "6",
                volume: "mmol/L",
              ),
              MyReport(
                type: "Cholesterol",
                value: "6.2",
                volume: "mmol/L",
              ),
              MyReport(
                type: "Bilirubin",
                value: "12",
                volume: "mmol/L",
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyReport(
                type: "RBC",
                value: "3.6",
                volume: "ml/L",
              ),
              MyReport(
                type: "MCV",
                value: "102",
                volume: "fl",
              ),
              MyReport(
                type: "Platelets",
                value: "276",
                volume: "bl",
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: myButton(
              background_Color: Theme.of(context).primaryColor,
              font_Size: 22,
              function: () {
                Navigator.of(context).pop();
              },
              name: "Report",
              text_color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
