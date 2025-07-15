import 'package:blood/Donor/MyDonor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Find_Donor extends StatefulWidget {
  const Find_Donor({super.key});

  @override
  State<Find_Donor> createState() => _Find_DonorState();
}

class _Find_DonorState extends State<Find_Donor> {
  int countDonate = 0;
  List<Map<String, dynamic>> dataUsers = [];
  List<Map<String, dynamic>> DataDonor = [];
  CollectionReference DonorRef = FirebaseFirestore.instance.collection("Donor");
  CollectionReference UsersRef = FirebaseFirestore.instance.collection("users");
  getdata() async {
    await DonorRef.get().then((donorSnapshot) async {
      List<QueryDocumentSnapshot> donorDocs = donorSnapshot.docs;
      for (var donorDoc in donorDocs) {
        Map<String, dynamic> dataDonor =
            donorDoc.data() as Map<String, dynamic>;
        DataDonor.add(dataDonor);

        String userUID = dataDonor["UID"];
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
      return countDonate;
    } catch (e) {
      print("Error: $e");
      return 0;
    }
  }

  @override
  void initState() {
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
          "Find Donors",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0XFFF5F5F5),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('search');
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0XFFF5F5F5),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("home");
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
      body: (dataUsers.isNotEmpty && DataDonor.isNotEmpty)
          ? ListView.builder(
              itemCount: dataUsers.length,
              itemBuilder: (context, index) {
                final user = dataUsers[index];
                final userDonor = DataDonor[index];
                return MyDonor(
                  image: user["imageURL"],
                  Blood_type: user["Blood_Group"],
                  name: user["username"],
                  location: user["location"],
                  city: userDonor["city"],
                  phone: userDonor["phone"],
                  hospital: userDonor["hospital"],
                  nmbrDonate: "${countDonate}",
                );
              },
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
