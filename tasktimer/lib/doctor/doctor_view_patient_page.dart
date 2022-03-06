import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '/fill_details.dart';
import '/login_screens/login.dart';
import '../datamodel.dart';
import '/admin/add_doctors_details.dart';
import 'add_patient_detail.dart';
import 'patient_info.dart';

class DoctorViewPatientScreen extends StatefulWidget {
  const DoctorViewPatientScreen({Key? key}) : super(key: key);

  @override
  State<DoctorViewPatientScreen> createState() =>
      _DoctorViewPatientScreenState();
}

class _DoctorViewPatientScreenState extends State<DoctorViewPatientScreen> {
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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainLoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        title: Text("Patient's Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints.expand(),
          child: FirebaseAnimatedList(
            query: patientdata,
            itemBuilder: (context, snapshot, animation, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientInfoScreen(
                                patientdataList[index].pname,
                                patientdataList[index].pphone,
                                patientdataList[index].pdisease,
                                patientdataList[index].pabout,
                                patientdataList[index].paddress)),
                      );
                    },
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(snapshot.value['patname']),
                      subtitle: Text(snapshot.value['patdisease']),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     // updateDialog(
                      //     //     snapshot.value['title'],
                      //     //     snapshot.value['description'],
                      //     //     snapshot.value['datetime'],
                      //     //     context,
                      //     //     snapshot.key);
                      //   },
                      //   icon: Icon(Icons.edit),
                      // ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddPatientDetailScreen()));
          },
          backgroundColor: const Color(0xfff7892b),
          child: const Icon(Icons.add)),
    );
  }
}
