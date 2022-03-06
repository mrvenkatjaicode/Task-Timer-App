import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';

class FillDetails extends StatefulWidget {
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

final doctordata = FirebaseDatabase.instance.reference().child("doctordata");
final patientdata = FirebaseDatabase.instance.reference().child("patientdata");

final databaseRef = FirebaseDatabase.instance.reference().child("timerapp");
final Future<FirebaseApp> _future = Firebase.initializeApp();
// ignore: top_level_function_literal_block
final vvm = databaseRef.once().then((DataSnapshot dataSnapshot) {
  print('${dataSnapshot.key}');
});

class _FillDetailsState extends State<FillDetails> {
  // ignore: deprecated_member_use

  void addData(
    String title,
    String description,
    String datetime,
  ) {
    databaseRef.push().set(
        {'title': title, 'description': description, 'datetime': datetime});
  }

  void printFirebase() {
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final datetimecontroller = TextEditingController();
  final format = DateFormat("HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    printFirebase();
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text("Set Task"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    color: Colors.blueGrey[50],
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              // color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 25, letterSpacing: 1),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    controller: titlecontroller,
                                    cursorColor: Colors.black,
                                    cursorHeight: 20,
                                    decoration: new InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Fill Task Title',
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 25, letterSpacing: 1),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    controller: descriptioncontroller,
                                    cursorColor: Colors.black,
                                    cursorHeight: 20,
                                    decoration: new InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Fill Task Description',
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Select Time",
                                    style: TextStyle(
                                        fontSize: 25, letterSpacing: 1),
                                  ),
                                  SizedBox(height: 15),
                                  DateTimeField(
                                    controller: datetimecontroller,
                                    format: format,
                                    decoration: new InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Select Time',
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        // borderRadius: new BorderRadius.circular(25.7),
                                      ),
                                    ),
                                    onShowPicker:
                                        (context, currentValue) async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return DateTimeField.convert(time);
                                    },
                                  ),
                                  SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.amber[300],
                                              onPrimary: Colors.black,
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                              )),
                                          onPressed: () {
                                            if (titlecontroller
                                                    .value.text.isNotEmpty &&
                                                descriptioncontroller
                                                    .value.text.isNotEmpty &&
                                                datetimecontroller
                                                    .value.text.isNotEmpty) {
                                              addData(
                                                  titlecontroller.text,
                                                  descriptioncontroller.text,
                                                  datetimecontroller.text);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()),
                                              );
                                            } else {
                                              print("Fill TextField");

                                              // Toast.show("Textfield cant be empty", context,
                                              //     duration: Toast.LENGTH_LONG,
                                              //     gravity: Toast.BOTTOM);
                                            }
                                          },
                                          child: Text("Save"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }

  postData() {
    var urll =
        "https://tasksave-22382-default-rtdb.firebaseio.com/timerdata.json";
    var url = Uri.parse(urll);

    final body = {
      'title': '${titlecontroller.text}',
      'description': '${descriptioncontroller.text}',
      'datetime': '${datetimecontroller.text}'
    };
    http.post(url, body: jsonEncode(body)).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        titlecontroller.clear();
        descriptioncontroller.clear();
        datetimecontroller.clear();
      } else {
        // Toast.show("Enter valid data", context,
        //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        print("error");
        print(response.statusCode);
      }
    });
  }
}
