import 'package:flutter/material.dart';

import 'ResetPasswordForm.dart';
import 'login.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.7, 0.7, 4.5],
              colors: [
                Color(0xFFD3D3FF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFAD4C3),
              ],
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Color(0xEE202468),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              const Text(
                "Reset Password",
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontFamily: 'Volkhov-Bold',
                  //fontFamily: 'OpenSansCondensedBold',
                  fontWeight: FontWeight.w900,
                  //fontWeight: FontWeight.bold,
                  fontSize: 37,
                ),
              ),
              const SizedBox(
                height: 20.5,
              ),
              Text(
                "Please enter your email address",
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  color: Colors.blueGrey[900],
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ResetPasswordForm(),
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  //defining the shape
                  color: const Color(0xEE9397DB),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: const Color(0xEE9397DB),
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
