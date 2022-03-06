import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../datamodel.dart';
import '/login_screens/login.dart';

class PatientDetailScreen extends StatefulWidget {
  const PatientDetailScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  List<PatientData> patientdataList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("patientdata");
    referenceData.once().then((DataSnapshot dataSnapshot) {
      patientdataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        PatientData data = new PatientData(
          values[key]['patname'],
          values[key]['patphone'],
          values[key]['patdisease'],
          values[key]['patabout'],
          values[key]['pataddress'],
        );
        patientdataList.add(data);
      }
      setState(() {
        patientdataList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainLoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Name : ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  patientdataList[1].pname,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Phone : ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  patientdataList[1].pphone,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Disease : ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  patientdataList[1].pdisease,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "About : ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  patientdataList[1].pabout,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Address : ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  patientdataList[1].paddress,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
