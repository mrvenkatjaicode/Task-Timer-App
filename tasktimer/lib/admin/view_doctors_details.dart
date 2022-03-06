import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '/login_screens/login.dart';

import '../datamodel.dart';
import '../fill_details.dart';
import 'add_doctors_details.dart';
import 'doctor_info_page.dart';

class ViewDoctorsDetailsScreen extends StatefulWidget {
  const ViewDoctorsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ViewDoctorsDetailsScreen> createState() =>
      _ViewDoctorsDetailsScreenState();
}

class _ViewDoctorsDetailsScreenState extends State<ViewDoctorsDetailsScreen> {
  List<DoctorData> doctordataList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("doctordata");
    referenceData.once().then((DataSnapshot dataSnapshot) {
      doctordataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        DoctorData data = new DoctorData(
          values[key]['docname'],
          values[key]['docmail'],
          values[key]['docphone'],
          values[key]['docspealist'],
          values[key]['docabout'],
          values[key]['docaddress'],
        );
        doctordataList.add(data);
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
        title: const Text("Doctor's Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints.expand(),
          child: FirebaseAnimatedList(
            query: doctordata,
            itemBuilder: (context, snapshot, animation, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorsInfo(
                                doctordataList[index].dname,
                                doctordataList[index].dmail,
                                doctordataList[index].dphone,
                                doctordataList[index].dspealist,
                                doctordataList[index].dabout,
                                doctordataList[index].daddress)),
                      );
                    },
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(snapshot.value['docname']),
                      subtitle: Text(snapshot.value['docspealist']),
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
                    builder: (context) => const AddDoctorsDetailsScreen()));
          },
          backgroundColor: const Color(0xfff7892b),
          child: const Icon(Icons.add)),
    );
  }
}
