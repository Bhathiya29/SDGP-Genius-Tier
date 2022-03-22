import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: databasePage(),
  ));
}

class databasePage extends StatelessWidget {
  const databasePage({Key? key}) : super(key: key);

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
        title: const Text('Your Passwords'),
        backgroundColor: const Color(0xEE4249E2),
        elevation: 0,
      ),
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
              const Text(
                "Previous Passwords",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontFamily: 'Volkhov-Bold',
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  //minWidth: double.infinity,
                  onPressed: () {},
                  //defining the shape
                  color: const Color(0xFFFF9D4E),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFFFF9D4E),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Generate New Password",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
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
              onPressed: () {},
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
              onPressed: () {},
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
