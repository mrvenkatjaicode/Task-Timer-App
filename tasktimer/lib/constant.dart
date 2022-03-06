import 'package:flutter/material.dart';

String appname = "Care Health";
Widget admin(context) {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'A',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
        children: [
          TextSpan(
            text: 'dm',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'in',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: '  L',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'og',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: 'in',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}

Widget doctor(context) {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'Do',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
        children: [
          TextSpan(
            text: 'ct',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'or',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: '  L',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'og',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: 'in',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}

Widget patient(context) {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'Pa',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
        children: [
          TextSpan(
            text: 'tie',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'nt',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: '  L',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'og',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: 'in',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}
Widget title(context) {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'C',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
        children: [
          TextSpan(
            text: 'ar',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'e',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: '  H',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'eal',
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(
            text: 'th',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}

Widget ttitle() {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'd',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: [
          TextSpan(
            text: 'ev',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'rnz',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}

Widget divider() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: const <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}

Widget facebookButton() {
  return Container(
    height: 50,
    margin: const EdgeInsets.symmetric(vertical: 20),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff1959a9),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
            ),
            alignment: Alignment.center,
            child: const Text('f',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff2872ba),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5)),
            ),
            alignment: Alignment.center,
            child: const Text('Log in with Facebook',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    ),
  );
}

Widget label() {
  return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: const <Widget>[
          Text(
            'Quick login with Touch ID',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(Icons.fingerprint, size: 90, color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Text(
            'Touch ID',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ));
}

  // Widget ititle(context) {
  //   return RichText(
  //     textAlign: TextAlign.center,
  //     text: TextSpan(
  //         text: 'C',
  //         style: GoogleFonts.portLligatSans(
  //           textStyle: Theme.of(context).textTheme.headline1,
  //           fontSize: 30,
  //           fontWeight: FontWeight.w700,
  //           color: Colors.white,
  //         ),
  //         children: const [
  //           TextSpan(
  //             text: 'ar',
  //             style: TextStyle(color: Colors.black, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: 'e',
  //             style: TextStyle(color: Colors.white, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: '  H',
  //             style: TextStyle(color: Colors.black, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: 'eal',
  //             style: TextStyle(color: Colors.white, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: 'th',
  //             style: TextStyle(color: Colors.black, fontSize: 30),
  //           ),
  //         ]),
  //   );
  // }
