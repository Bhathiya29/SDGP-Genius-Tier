import 'dart:io';

import 'package:flutter/material.dart';

import 'home.dart';

// void main() {
//   runApp(const MyApp());
// }

class generationPage extends StatelessWidget {
  const generationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  bool _isObscure = false;
  void _doSomething() {
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconData(0xeff6, fontFamily: 'MaterialIcons'),
            ),
            onPressed: () => Navigator.of(context).pop(exit(1)),
          ),
        ],
        title: const Text('Generate'),
        backgroundColor: const Color(0xEE4249E2),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFD3D3FF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFAD4C3),
            ],
            stops: [0.2, 0.7, 0.7, 4.5],
          ),
        ),
        //padding: const EdgeInsets.only(left: 40, right: 40),

        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 0),
        key: formKey, //key for form
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Generate Your ",
              style: TextStyle(
                letterSpacing: 1.6,
                color: Colors.black,
                fontFamily: 'Volkhov-Bold',
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            const Text(
              "Password ",
              style: TextStyle(
                letterSpacing: 1.6,
                color: Colors.black,
                fontFamily: 'Volkhov-Bold',
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Center(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Enter Your Keyword No 1"),
                validator: (keyword1) {
                  if (keyword1!.isEmpty) {
                    return 'Please enter your keyword number 1';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Enter Your Keyword No 2"),
                validator: (keyword1) {
                  if (keyword1!.isEmpty) {
                    return 'Please enter your keyword number 1';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blueGrey)),
                        child: _isObscure
                            ? Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.green[900],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "I agree to terms and conditions.",
                      style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        color: Colors.grey[700],
                        fontSize: 13.5,
                      ),
                    ),
                    //Text(widget.text),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 45,
                onPressed: () {},
                //defining the shape
                color: const Color(0xFFFF9D4E),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFFF9D4E),
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Generate Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 9.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 30.0,
                semanticLabel: 'Home',
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            const SizedBox(width: 32.0),
            IconButton(
              icon: const Icon(
                Icons.add_circle_sharp,
                size: 30.0,
                color: Color(0xFFFF9D4E),
                semanticLabel: 'Generate',
              ),
              //backgroundColor: Color(0xFFFF9800),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const generationPage()));
              },
            ),
            const SizedBox(width: 32.0),
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 30.0,
                semanticLabel: 'Database',
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
