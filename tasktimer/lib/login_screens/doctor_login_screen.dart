import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tasktimer/admin/doctor_info_page.dart';
import '../fill_details.dart';
import '/doctor/doctor_homepage.dart';

import '../Widget/bezierContainer.dart';
import '../constant.dart';
import '../datamodel.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Widget textbox(TextEditingController boxcontroller) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Fill this';
        }
        return null;
      },
      controller: boxcontroller,
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
      ),
    );
  }

  Widget passwordtextbox(TextEditingController boxcontroller) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Fill this';
        }
        return null;
      },
      obscureText: true,
      controller: boxcontroller,
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: new BorderRadius.circular(25.7),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          // print("-----${phonenocontroller.text}");
          // print("====${passwordcontroller.text}");

          // print("ttt${storage.getItem('signupphone')}");
          // print("iiiii${storage.getItem('signuppassword')}");

          if ((usernamecontroller.text == "Doctor1") &&
              passwordcontroller.text == "Doctor@1") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorHomepageScreen(
                        doctordataList[1].dname,
                        doctordataList[1].dmail,
                        doctordataList[1].dphone,
                        doctordataList[1].dspealist,
                        doctordataList[1].dabout,
                        doctordataList[1].daddress)));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Center(
                      child: Text(
                        "Error",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    content: Text(
                      "Username or Password is incorrect",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                });
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Widget _createAccountLabel() {
  //   return InkWell(
  //     onTap: () {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text("Success"),
  //               content: Text("Saved successfully"),
  //             );
  //           });
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context) => const SignUpPage()));
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 20),
  //       padding: const EdgeInsets.all(15),
  //       alignment: Alignment.bottomCenter,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const <Widget>[
  //           Text(
  //             'Don\'t have an account ?',
  //             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Text(
  //             'Register',
  //             style: TextStyle(
  //                 color: Color(0xfff79c4f),
  //                 fontSize: 13,
  //                 fontWeight: FontWeight.w600),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  doctor(context),
                  const SizedBox(height: 50),

                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Username",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textbox(usernamecontroller),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        passwordtextbox(passwordcontroller),
                      ],
                    ),
                    key: formKey,
                  ),
                  const SizedBox(height: 20),
                  _submitButton(),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   alignment: Alignment.centerRight,
                  //   child: const Text('Forgot Password ?',
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.w500)),
                  // ),
                  // _divider(),
                  // _facebookButton(),
                  SizedBox(height: height * .055),
                  //_createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
