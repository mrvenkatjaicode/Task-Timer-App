import 'dart:async';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasktimer/fill_details.dart';
import 'package:tasktimer/show_page.dart';

import 'datamodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> dataList = [];
  final format = DateFormat("HH:mm:ss");

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
        print(values[key]['datetime'][0]);
        print(values[key]['datetime'][1]);
        print(values[key]['datetime'][2]);
        print(values[key]['datetime'][3]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
            "https://raw.githubusercontent.com/mrvenkatjaicode/Image/main/Whatsapp/playstore.png"),
        title: Text("Assigned Tasks"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (context, snapshot, animation, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowPage(
                              dataList[index].title,
                              dataList[index].description,
                              dataList[index].datetime)),
                    );
                  },
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://raw.githubusercontent.com/mrvenkatjaicode/Image/main/Whatsapp/playstore.png"),
                    ),
                    title: Text(snapshot.value['title']),
                    subtitle: Text(snapshot.value['datetime']),
                    trailing: IconButton(
                      onPressed: () {
                        updateDialog(
                            snapshot.value['title'],
                            snapshot.value['description'],
                            snapshot.value['datetime'],
                            context,
                            snapshot.key);
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[300],
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FillDetails()),
            );
          },
        ),
      ),
    );
  }

  Future<void> updateDialog(
      String title, description, time, BuildContext context, var key) {
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
                    UpdateData(titlecontroller.text, descriptioncontroller.text,
                        datetimecontroller.text, key);
                    Navigator.of(context).pop();
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

  void UpdateData(String title, description, time, var key) {
    Map<String, String> x = {
      "title": title,
      "description": description,
      "datetime": time
    };
    databaseRef.child(key).update(x);
  }
}
