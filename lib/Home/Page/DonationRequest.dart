import 'package:blood/Component/MyDonationRequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DenationRequest extends StatefulWidget {
  const DenationRequest({super.key});

  @override
  State<DenationRequest> createState() => _DenationRequestState();
}

class _DenationRequestState extends State<DenationRequest> {
  int countDonate = 0;
  List<Map<String, dynamic>> dataUsers = [];
  List<Map<String, dynamic>> DataRequest = [];
  CollectionReference RequestRef =
      FirebaseFirestore.instance.collection("request");
  CollectionReference UsersRef = FirebaseFirestore.instance.collection("users");
  getdata() async {
    await RequestRef.get().then((donorSnapshot) async {
      List<QueryDocumentSnapshot> requestDocs = donorSnapshot.docs;
      for (var requestDoc in requestDocs) {
        Map<String, dynamic> dataRequest =
            requestDoc.data() as Map<String, dynamic>;
        DataRequest.add(dataRequest);

        String userUID = dataRequest["UID"];
        print(userUID);
        await UsersRef.doc(userUID).get().then((userDoc) {
          if (userDoc.exists) {
            Map<String, dynamic> userData =
                userDoc.data() as Map<String, dynamic>;
            dataUsers.add(userData);
          }
        });
      }
      setState(() {});
    });
    print(DataRequest);
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        title: Text(
          "Donation Request",
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
      body: (dataUsers.isNotEmpty && DataRequest.isNotEmpty)
          ? ListView.builder(
              itemCount: DataRequest.length,
              itemBuilder: (context, item) {
                final user = dataUsers[item];
                final userDonor = DataRequest[item];
                return Column(
                  children: [
                    MydonationRequest(
                      name: user["username"],
                      blood_type: user["Blood_Group"],
                      city: userDonor["city"],
                      hospital: userDonor["hospital"],
                      phone: user["phone"],
                    ),
                    SizedBox(height: 10)
                  ],
                );
              })
          : Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
            ),
    );
  }
}
