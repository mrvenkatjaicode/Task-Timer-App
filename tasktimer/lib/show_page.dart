import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:tasktimer/notofication.dart';

import 'datamodel.dart';
import 'fill_details.dart';

class ShowPage extends StatefulWidget {
  String title, description, time;

  ShowPage(this.title, this.description, this.time);
  @override
  _ShowPageState createState() => _ShowPageState(title, description, time);
}

class _ShowPageState extends State<ShowPage> {
  String title, description, time;

  _ShowPageState(this.title, this.description, this.time);
  List<Data> dataList = [];

  void initState() {
    super.initState();
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("timerapp");
    referenceData.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        Data data = new Data(
          values[key]['title'],
          values[key]['description'],
          values[key]['datetime'],
        );
        dataList.add(data);
      }
      setState(() {});
    });
  }

  final format = DateFormat("HH:mm");
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo Tasks"),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     updateDialog(title, description, time, context);
          //   },
          //   icon: Icon(Icons.edit),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.delete),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Tasks",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.teal[50],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Title : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.teal[50],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Description : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                          Text(
                            description,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.teal[50],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Remaining Time : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                          TimerCountdown(
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                // days: 5,
                                hours: 0,
                                minutes: 0,
                                seconds: 34,
                              ),
                            ),
                            onEnd: () {
                              NotificationApi.showNotification(
                                title: title,
                                body: 'Your task is finished',
                                payload: 'Completed',
                              );
                            },
                            timeTextStyle: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            colonsTextStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            // descriptionTextStyle: TextStyle(
                            //   color: Colors.red,
                            //   fontSize: 18,
                            // ),
                            spacerWidth: 20,
                            // daysDescription: "d",
                            hoursDescription: "h",
                            minutesDescription: "m",
                            secondsDescription: "s",
                          ),
                          // Text(
                          //   "${time[0]}${time[1]}",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 22,
                          //       fontWeight: FontWeight.w300),
                          // ),
                          SizedBox(height: 20),
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
                              onPressed: () {},
                              child: Text("Stop"),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateDialog(
      String title, description, time, BuildContext context) {
    final titlecontroller = TextEditingController(text: title);
    final descriptioncontroller = TextEditingController(text: description);
    final datetimecontroller = TextEditingController(text: time);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Value"),
            content: Column(
              children: [
                TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter your Title"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descriptioncontroller,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter your Description"),
                ),
                DateTimeField(
                  controller: datetimecontroller,
                  format: format,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter your Time"),
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.convert(time);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    // UpdateData(title, description, time);
                  },
                  child: Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }

  // void UpdateData(String title, description, time) {
  //   Map<String, String> x = {
  //     "title": title,
  //     "description": description,
  //     "datetime": time
  //   };
  //   databaseRef.child("timerapp").update(x);
  // }
}
