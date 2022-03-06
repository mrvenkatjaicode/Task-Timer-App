// ignore_for_file: avoid_print

// ignore: library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class DoctorsInfo extends StatefulWidget {
  String name, mail, phone, spealist, about, address;

  DoctorsInfo(this.name, this.mail, this.phone, this.spealist, this.about,
      this.address);

  @override
  _DoctorsInfoState createState() =>
      _DoctorsInfoState(name, mail, phone, spealist, about, address);
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  String name, mail, phone, spealist, about, address;

  _DoctorsInfoState(this.name, this.mail, this.phone, this.spealist, this.about,
      this.address);
  List<Data> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/doctor_pic2.png", height: 220),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: const TextStyle(fontSize: 32),
                        ),
                        Text(
                          spealist,
                          style:
                              const TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          widget.mail,
                          style:
                              const TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        Text(
                          phone,
                          style:
                              const TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        // Row(
                        //   children: const <Widget>[
                        //     IconTile(
                        //       backColor: Color(0xffFFECDD),
                        //       imgAssetPath: "assets/email.png",
                        //     ),
                        //     IconTile(
                        //       backColor: Color(0xffFEF2F0),
                        //       imgAssetPath: "assets/call.png",
                        //     ),
                        //     IconTile(
                        //       backColor: Color(0xffEBECEF),
                        //       imgAssetPath: "assets/video_call.png",
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                "About",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                about,
                // "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/mappin.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    address,
                                    // "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                    style: const TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: const Text(
                                    '''Monday - Friday
Open till 7 Pm''',
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width: 180,
                  )
                ],
              ),
              // const Text(
              //   "Activity",
              //   style: TextStyle(
              //       color: Color(0xff242424),
              //       fontSize: 28,
              //       fontWeight: FontWeight.w600),
              // ),
              // const SizedBox(
              //   height: 22,
              // ),
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 24, horizontal: 16),
              //         decoration: BoxDecoration(
              //             color: const Color(0xffFBB97C),
              //             borderRadius: BorderRadius.circular(20)),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //                 padding: const EdgeInsets.all(8),
              //                 decoration: BoxDecoration(
              //                     color: const Color(0xffFCCA9B),
              //                     borderRadius: BorderRadius.circular(16)),
              //                 child: Image.asset("assets/list.png")),
              //             const SizedBox(
              //               width: 16,
              //             ),
              //             InkWell(
              //               onTap: () {},
              //               child: SizedBox(
              //                 width:
              //                     MediaQuery.of(context).size.width / 2 - 130,
              //                 child: const Text(
              //                   "List Of Schedule",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 17),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 16,
              //     ),
              //     Expanded(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 24, horizontal: 16),
              //         decoration: BoxDecoration(
              //             color: const Color(0xffA5A5A5),
              //             borderRadius: BorderRadius.circular(20)),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Container(
              //                 padding: const EdgeInsets.all(8),
              //                 decoration: BoxDecoration(
              //                     color: const Color(0xffBBBBBB),
              //                     borderRadius: BorderRadius.circular(16)),
              //                 child: Image.asset("assets/list.png")),
              //             const SizedBox(
              //               width: 16,
              //             ),
              //             InkWell(
              //               onTap: () {
              //                 // Navigator.push(
              //                 //     context,
              //                 //     MaterialPageRoute(
              //                 //         builder: (context) =>
              //                 //             const PatientDetailFillScreen()));
              //               },
              //               child: SizedBox(
              //                 width:
              //                     MediaQuery.of(context).size.width / 2 - 130,
              //                 child: const Text(
              //                   "List of Patient",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 17),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String? imgAssetPath;
  final Color? backColor;

  const IconTile({
    Key? key,
    this.imgAssetPath,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath!,
          width: 20,
        ),
      ),
    );
  }
}

class Data {
  String name, mail, phone, spealist, about, address;
  Data(this.name, this.mail, this.phone, this.spealist, this.about,
      this.address);
}
