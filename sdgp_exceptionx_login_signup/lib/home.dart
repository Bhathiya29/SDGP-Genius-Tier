//import 'dart:html';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:genius_tier/signup.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'UyMf6pGjdnutg5xoh5GD0VqPrf6LSFUaZRqB8LEA';
  const keyClientKey = '02EheocotLc1iFjVkxXLm5w5eM6GT9dYlNvBBce5';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 55),
          child: Column(
            //space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontFamily: 'Volkhov-Bold',
                      //fontFamily: 'OpenSansCondensedBold',
                      fontWeight: FontWeight.w900,
                      //fontWeight: FontWeight.bold,
                      fontSize: 43,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "All in one password solution",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'SignikaNegative',
                      color: Colors.grey[700],
                      fontSize: 16.5,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/Logoo.png'))),
              ),
              //Login Button
              MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                //defining the shape
                color: const Color(0xEE4249E2),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF656CEE),
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Sign up button
              MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                color: const Color(0xFFFF9D4E),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFFF9D4E),
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Sign UP",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
