import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  bool agree = false;
  late double _height;
  late double _width;
  int percent = 0;
  void _doSomething() {
    // Do something
  }





    @override
    void initState() {
      Timer timer;
      timer = Timer.periodic(Duration(milliseconds:1000),(_){
        setState(() {
          percent+=10;
          if(percent >= 100){
            //timer.cancel();
            percent=0;
          }
        });
      });
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return  Scaffold(

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  IconData(0xe040, fontFamily: 'MaterialIcons'),
                ),
                onPressed: () {},
              ),
              SizedBox(width: 48.0),
              IconButton(
                icon:Icon(Icons.add_outlined),
              //backgroundColor: Color(0xFFFF9800),
                onPressed: () {},
              ),
              SizedBox(width: 48.0),
              IconButton(
                icon: Icon(
                  IconData(0xee35, fontFamily: 'MaterialIcons'),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   backgroundColor: Color(0xFFFF9800),
        //   onPressed: () {},
        // ),
        key: _scaffoldKey,

        appBar: new AppBar(
          actions: <Widget>[

            new IconButton(
              icon:Icon(IconData(0xeff6, fontFamily: 'MaterialIcons')),

              onPressed: () => Navigator.of(context).pop(exit(1)),
            ),
          ],
          title: new Text('Strength Checker'),
          backgroundColor: Color(0xEE4249E2),
          elevation: 0,
        ),

        // backgroundColor: Color(0xFFffffff),


        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xF2D6D6FD),
                Color(0xFFFFFFFF),
                Color(0xFCFFFFFF),
                Color(0xDAFFEDE5),
              ],
              stops: [0.2, 0.7, 0.7, 4.5],
            ),
          ),
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child:

            Column(


              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:height*0.01),
                Text("Check Your ", style: TextStyle(fontSize: 30, color:Color(0xDD000000)),),
                Text("Password Strength ", style: TextStyle(fontSize: 30, color:Color(0xDD000000)),),
                SizedBox(height: height * 0.02,),
                TextFormField(
                  autocorrect: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            style: BorderStyle.solid)),
                    hintStyle: TextStyle(
                        color: Color(0xFFFF9800)),
                    suffixIcon: Icon(Icons.copy), // this is right side.
                    hintText: "Enter Your Password",
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(38, 38, 38, 0.4),
                    fontSize:14,
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(145, 5, 5, 1),
                  child: FlatButton(
                    child: Text('Re-Generate', style: TextStyle(fontSize: 20.0),),
                    color: Color(0xEE4249E2),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Strength',
                      style: TextStyle(
                          color: Color(0xEE4249E2),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        child: CircularPercentIndicator(
                          radius: 190.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: percent/100,
                          center: Text(
                            percent.toString() ,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          //backgroundColor: Colors.grey[300],
                          circularStrokeCap: CircularStrokeCap.round,
                          linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFFFF9800),
                              Color(0xEE4249E2),
                            ],
                          ),
                          //progressColor: Colors.deepOrangeAccent,
                        )
                    ),
                    Container(
                        height: 100,
                        child: Row(
                            children : <Widget>[
                              Expanded(
                                  child: RaisedButton(
                                      onPressed: () {},
                                      color: Color(0xFFFF9800),
                                      child: Text("Back", style: TextStyle(color: Colors.white),)
                                  )
                              ),
                              SizedBox(width: 50),
                              Expanded(
                                  child: RaisedButton(
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.error,
                                          title: "RFLUTTER ALERT",
                                          desc: "Flutter is more awesome with RFlutter Alert.",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "COOL",
                                                style: TextStyle(color: Colors.white, fontSize: 20),
                                              ),
                                              onPressed: () => Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      },
                                      color: Color(0xEE4249E2),
                                      child: Text("Next", style: TextStyle(color: Colors.white),)
                                  )
                              ),
                            ])
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }


}