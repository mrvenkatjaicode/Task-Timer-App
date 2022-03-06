import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Localstorage Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class TodoItem {
  String title;
  String disc;
  bool done;

  TodoItem({required this.title, required this.disc, required this.done});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['title'] = title;
    m['disc'] = disc;
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

class _MyHomePageState extends State<HomePage> {
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final format = DateFormat("yyyy-MM-dd  HH:mm");
  final TodoList list = new TodoList();
  final LocalStorage storage = new LocalStorage('todo_app');
  bool initialized = false;
  TextEditingController controller = new TextEditingController();

  _toggleItem(TodoItem item) {
    setState(() {
      item.done = !item.done;
      _saveToStorage();
    });
  }

  _addItem(String title, String body) {
    setState(() {
      final item = new TodoItem(title: title, disc: "body", done: false);
      list.items.add(item);
      _saveToStorage();
    });
  }

  _saveToStorage() {
    storage.setItem('todos', list.toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      list.items = storage.getItem('todos') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Localstorage demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints.expand(),
        child: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!initialized) {
              var items = storage.getItem('todos');

              if (items != null) {
                list.items = List<TodoItem>.from(
                  (items as List).map(
                    (item) => TodoItem(
                      title: item['title'],
                      disc: item['disc'],
                      done: item['done'],
                    ),
                  ),
                );
              }

              initialized = true;
            }

            List<Widget> widgets = list.items.map((item) {
              return ListTile(
                // value: item.done,
                title: Text(item.title),
                subtitle: Text("item.disc"),
                selected: item.done,
                // onChanged: (_) {
                //   _toggleItem(item);
                // },
              );
            }).toList();

            return Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: widgets,
                    itemExtent: 50.0,
                  ),
                ),
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
                ListTile(
                  title: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'What to do?',
                    ),
                    onEditingComplete: _save,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.save),
                        onPressed: _save,
                        tooltip: 'Save',
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: _clearStorage,
                        tooltip: 'Clear storage',
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _save() {
    _addItem(titlecontroller.value.text, controller.value.text);
    controller.clear();
  }
}
