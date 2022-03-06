import '/login_screens/patient_login_screen.dart';

import '/login_screens/doctor_login_screen.dart';
import 'package:flutter/material.dart';

import 'admin_login_screen.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  State<MainLoginScreen> createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  // Widget _submitButton() {
  //   return InkWell(
  //     onTap: () {
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context) => const LoginPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: const EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //           borderRadius: const BorderRadius.all(Radius.circular(5)),
  //           boxShadow: <BoxShadow>[
  //             BoxShadow(
  //                 color: const Color(0xffdf8e33).withAlpha(100),
  //                 offset: const Offset(2, 4),
  //                 blurRadius: 8,
  //                 spreadRadius: 2)
  //           ],
  //           color: Colors.white),
  //       child: const Text(
  //         'Login',
  //         style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
  //       ),
  //     ),
  //   );
  // }

  Widget adminLoginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminLoginScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: const Color(0xffdf8e33).withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: const Text(
          'Admin Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget doctorLoginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DoctorLoginScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: const Color(0xffdf8e33).withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: const Text(
          'Doctor Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget patientLoginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PatientLoginScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: const Color(0xffdf8e33).withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: const Text(
          'Patient Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
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

  // Widget _signUpButton() {
  //   return InkWell(
  //     onTap: () {
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context) => const SignUpPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: const EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.all(Radius.circular(5)),
  //         border: Border.all(color: Colors.white, width: 2),
  //       ),
  //       child: const Text(
  //         'Register now',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              title(context),
              const SizedBox(
                height: 80,
              ),
              adminLoginButton(),
              const SizedBox(
                height: 20,
              ),
              doctorLoginButton(),
              const SizedBox(
                height: 20,
              ),
              patientLoginButton(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
