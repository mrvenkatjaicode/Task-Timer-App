import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;

class FillDetails extends StatefulWidget {
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final datetimecontroller = TextEditingController();
  final format = DateFormat("yyyy-MM-dd  HH:mm");
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Set Task"),
      ),
      body: Container(
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
                        style: TextStyle(fontSize: 25, letterSpacing: 1),
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
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 25, letterSpacing: 1),
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
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Select Time",
                        style: TextStyle(fontSize: 25, letterSpacing: 1),
                      ),
                      SizedBox(height: 15),
                      DateTimeField(
                        controller: datetimecontroller,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Select Date and Time',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            // borderRadius: new BorderRadius.circular(25.7),
                          ),
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
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
                                if (titlecontroller.value.text.isNotEmpty &&
                                    descriptioncontroller
                                        .value.text.isNotEmpty &&
                                    datetimecontroller.value.text.isNotEmpty) {
                                  fetchPost();
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
                      // ElevatedButton(
                      //     onPressed: () {
                      //       fetchGet();
                      //     },
                      //     child: Text("View"))
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

  fetchPost() {
    var url = Uri.parse(
        "https://task-timer-57225-default-rtdb.firebaseio.com/" +
            "timerdata.json");
    // final head = {
    //   "Accept": "$accept",
    //   "Content-Type": "$conttype",
    //   "x-api-version": "$apiver",
    //   "x-client-id": "$cliid",
    //   "x-client-secret": "$clisec"
    // };
    final body = {
      'title': "${titlecontroller.text}",
      'description': "${descriptioncontroller.text}",
      'datetime': "${datetimecontroller.text}",
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

  fetchGet() {
    http
        .get(Uri.parse(
            "https://task-timer-57225-default-rtdb.firebaseio.com/timerdata.json"))
        .then((response) {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        print(jsonData);
      } else {
        print("error");
        print(response.statusCode);
      }
    });
  }
}
