import 'dart:io';

import 'package:flutter/material.dart';

import 'generation.dart';
import 'home.dart';

class savePage extends StatefulWidget {
  final String generatePassword;
  const savePage(this.generatePassword);
  @override
  _savePageState createState() => _savePageState(generatePassword);
}

class _savePageState extends State<savePage> {
  TextEditingController passwordController = TextEditingController();
  String generatePassword;
  _savePageState(this.generatePassword);

  TextEditingController nameController = TextEditingController();
  String platform = '';

  TextEditingController userNameController = TextEditingController();
  String name = '';

  TextEditingController enterPasswordController = TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconData(0xeff6, fontFamily: 'MaterialIcons'),
            ),
            onPressed: () => Navigator.of(context).pop(exit(1)),
          ),
        ],
        title: const Text('Save'),
        backgroundColor: const Color(0xEE4249E2),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 37),
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
          //padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Save Password?",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontFamily: 'Volkhov-Bold',
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Your Password",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xEE171C4C),
                  ),
                ),
              ),
              Center(
                child: Text(
                  generatePassword,
                  //textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'OpenSansCondensedBold',
                    fontSize: 23,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Site/Platform',
                        hintText: 'facebook',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email/UserName',
                          hintText: 'abc@gmail.com/abc',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      controller: enterPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Generated Password',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                //height: 140,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        color: const Color(0xEE4950E2),
                        //color: const Color(0xFFFF9800),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xEE4950E2),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        color: const Color(0xFFFF9D4E),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFFFF9D4E),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //color: const Color(0xFF7E57C2),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
