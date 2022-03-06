import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PatientInfoScreen extends StatefulWidget {
  String name, phone, disease, about, address;
  PatientInfoScreen(
      this.name, this.phone, this.disease, this.about, this.address);
  @override
  State<PatientInfoScreen> createState() =>
      _PatientInfoScreenState(name, phone, disease, about, address);
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  String name, phone, disease, about, address;
  _PatientInfoScreenState(
      this.name, this.phone, this.disease, this.about, this.address);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Patient Information"),
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
                  name,
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
                  phone,
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
                  disease,
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
                  about,
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
                  address,
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
