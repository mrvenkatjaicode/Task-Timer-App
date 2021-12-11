import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tasktimer/fill_details.dart';
import 'package:tasktimer/show_page.dart';

import 'datamodel.dart';

class HomePage extends StatefulWidget {
  // var title;
  // var description;
  // var datetime;
  // HomePage(this.title, this.description, this.datetime);
  @override
  _HomePageState createState() => _HomePageState(
      // title,
      // description,
      // datetime,
      );
}

final LocalStorage storage = new LocalStorage('todo_app');

class TodoItem {
  String title;
  var description;
  var timedate;
  bool done;
  TodoItem(
      {required this.title,
      this.description,
      this.timedate,
      required this.done});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['title'] = title;
    m['refid'] = description;
    m['amount'] = timedate;
    m['done'] = done;

    return m;
  }
}

class TodoList {
  List<TodoItem> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}

class _HomePageState extends State<HomePage> {
  // var tit;
  // var des;
  // var dat;
  // var sampleid;
  List<Data> dataList = [];

  final TodoList list = new TodoList();
  bool initialized = false;

  // _HomePageState(this.tit, this.des, this.dat);

  _toggleItem(TodoItem item) {
    setState(() {
      item.done = !item.done;
      _saveToStorage();
    });
  }

  // _addItem(name) {
  //   setState(() {
  //     final item = new TodoItem(
  //         title: tit, description: des, timedate: dat, done: false);
  //     list.items.add(item);
  //     _saveToStorage();
  //   });
  // }

  _saveToStorage() {
    storage.setItem('todos', list.toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      list.items = storage.getItem('todos') ?? [];
    });
  }

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
        child: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            if (dataList.length == 0) {
              Center(
                child:
                    Text("No Datas Found Click Below Button to add new tasks"),
              );
            }
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
                    title: Text(dataList[index].title),
                    // subtitle: Text(dataList[index].description),
                    trailing: Text(dataList[index].datetime),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            );
          },
          itemCount: dataList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
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
}
