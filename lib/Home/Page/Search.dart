import 'package:blood/Component/myButton.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var location;
  var Blood_Group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE5E5E5),
        appBar: AppBar(
          backgroundColor: Color(0XFFE5E5E5),
          title: Text(
            "Search",
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                        onTap: () {},
                        title: Text(
                          "Search",
                          style:
                              TextStyle(color: Color(0XFFCDCDCD), fontSize: 18),
                        ),
                        leading: Icon(
                          Icons.search,
                          color: Color(0XFFCDCDCD),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset("images/filter.png"),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 490,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Filters",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Divider(
                      color: Color(0XFFEDEDED),
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                    Blood_Group = val.toString();
                                  });
                                },
                                value: Blood_Group,
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                    SizedBox(height: 40),
                    myButton(
                      background_Color: Theme.of(context).primaryColor,
                      font_Size: 22,
                      function: () {
                        //Request();
                      },
                      name: "Apply",
                      text_color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
