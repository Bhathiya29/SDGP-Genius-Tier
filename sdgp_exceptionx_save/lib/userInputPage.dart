import 'package:flutter/material.dart';
import 'package:password_save/savePage.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BuildBody(),
      ),
    );
  }
}

class BuildBody extends StatefulWidget {
  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  String textFromSecondScreen = '';
  TextEditingController txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            textFromSecondScreen,
            style: TextStyle(fontSize: 30),
          ),
          Row(
            children: <Widget>[
              const Text(" Type something: "),
              Flexible(
                child: TextField(
                  controller: txtController,
                ),
              ),
            ],
          ),
          RaisedButton(
            child: const Text("Send to second screen"),
            onPressed: () {
              goToSecondScreen(context);
            },
          )
        ],
      ),
    );
  }

  void goToSecondScreen(BuildContext context) async {
    String dataFromSecondPage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => savePage(txtController.text),
        ));
    setState(() {
      textFromSecondScreen = dataFromSecondPage;
    });
  }
}
