import 'package:flutter/material.dart';

import '../fill_details.dart';
import 'view_doctors_details.dart';

class AddDoctorsDetailsScreen extends StatefulWidget {
  const AddDoctorsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddDoctorsDetailsScreen> createState() =>
      _AddDoctorsDetailsScreenState();
}

class _AddDoctorsDetailsScreenState extends State<AddDoctorsDetailsScreen> {
  final namecontroller = TextEditingController();
  final mailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final specalistcontroller = TextEditingController();
  final aboutcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? name = "";
  String? mail = "";

  String? phone = "";
  String? spealist = "";
  String? about = "";
  String? address = "";
  String? namee = "";
  String? maill = "";

  String? phonee = "";
  String? spealistt = "";
  String? aboutt = "";
  String? addresss = "";
  cleartext() {
    namecontroller.clear();
    mailcontroller.clear();
    phonecontroller.clear();
    specalistcontroller.clear();
    aboutcontroller.clear();
    addresscontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Doctor Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.blueGrey[50],
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        text("Name"),
                        const SizedBox(height: 15),
                        textbox(namecontroller),
                        const SizedBox(height: 30),
                        text("Mail"),
                        const SizedBox(height: 15),
                        textbox(mailcontroller),
                        const SizedBox(height: 30),
                        text("Phone Number"),
                        const SizedBox(height: 15),
                        textbox(phonecontroller),
                        const SizedBox(height: 40),
                        text("Spealist"),
                        const SizedBox(height: 15),
                        textbox(specalistcontroller),
                        const SizedBox(height: 40),
                        text("About"),
                        const SizedBox(height: 15),
                        textbox(aboutcontroller),
                        const SizedBox(height: 40),
                        text("Address"),
                        const SizedBox(height: 15),
                        textbox(addresscontroller),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xfff7892b),
                                    onPrimary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    addData(
                                        namecontroller.text,
                                        mailcontroller.text,
                                        phonecontroller.text,
                                        specalistcontroller.text,
                                        aboutcontroller.text,
                                        addresscontroller.text);

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actions: [
                                              Center(
                                                child: TextButton(
                                                    onPressed: () {
                                                      cleartext();
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const ViewDoctorsDetailsScreen()));
                                                    },
                                                    child: Text(
                                                      "Ok",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    )),
                                              ),
                                            ],
                                            title: Center(
                                              child: Text(
                                                "Success",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                            content: Text(
                                              "Doctor's detail added successfully",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          );
                                        });
                                  }
                                  //   SharedPreferences prefs =
                                  //       await SharedPreferences.getInstance();
                                  //   prefs.setString(
                                  //       "Filldetail", "fillsuccess");
                                  //   postData();
                                  //   addItemsToLocalStorage();
                                  //   // getitemFromLocalStorage();
                                  //   // print("====$name");
                                  //   // print(namee);
                                  //   // print(maill);
                                  //   // print(phonee);
                                  //   // print(spealistt);
                                  //   // print(aboutt);
                                  //   // print(addresss);
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const DoctorsInfo()));
                                  //   // If the form is valid, display a Snackbar.
                                  //   // Scaffold.of(context)
                                  //   //     // ignore: deprecated_member_use
                                  //   //     .showSnackBar(const SnackBar(
                                  //   //         content: Text(
                                  //   //             'Data is in processing.')));

                                  // }
                                  // // if (titlecontroller.value.text.isNotEmpty &&
                                  // //     descriptioncontroller.value.text.isNotEmpty &&
                                  // //     datetimecontroller.value.text.isNotEmpty) {
                                  // //   addData(
                                  // //       titlecontroller.text,
                                  // //       descriptioncontroller.text,
                                  // //       datetimecontroller.text);
                                  // //   Navigator.push(
                                  // //     context,
                                  // //     MaterialPageRoute(
                                  // //         builder: (context) => HomePage()),
                                  // // );
                                  // // } else {
                                  // // print("Fill TextField");

                                  // // Toast.show("Textfield cant be empty", context,
                                  // //     duration: Toast.LENGTH_LONG,
                                  // //     gravity: Toast.BOTTOM);
                                  // //  }
                                },
                                child: const Text("Save"),
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
      ),
    );
  }

  void addData(
    String docname,
    String docmail,
    String docphone,
    String docspealist,
    String docabout,
    String docaddress,
  ) {
    doctordata.push().set({
      'docname': docname,
      'docmail': docmail,
      'docphone': docphone,
      'docspealist': docspealist,
      'docabout': docabout,
      'docaddress': docaddress,
    });
  }

  Widget text(String name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 20, letterSpacing: 1),
    );
  }

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
}
