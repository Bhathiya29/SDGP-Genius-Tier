import 'package:flutter/material.dart';
import 'package:genius_tier/signupform.dart';

import 'checkBox.dart';
import 'generation.dart';
import 'home.dart';
import 'login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                              builder: (context) => const HomePage()));
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
                height: 9,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontFamily: 'Volkhov-Bold',
                  //fontFamily: 'OpenSansCondensedBold',
                  fontWeight: FontWeight.w900,
                  //fontWeight: FontWeight.bold,
                  fontSize: 43,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Create your account",
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  color: Colors.grey[700],
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(
                height: 16.5,
              ),
              signupform(),
              const SizedBox(
                height: 15,
              ),
              checkBox(),
              const SizedBox(
                height: 25,
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
                          builder: (context) => const generationPage()),
                    );
                  },
                  //defining the shape
                  color: const Color(0xFFFF9D4E),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFFFF9D4E),
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 16,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  TextButton(
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xEE4950E2),
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      //signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
