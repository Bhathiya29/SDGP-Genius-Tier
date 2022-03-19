import 'package:flutter/material.dart';

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
  void _doSomething() {
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                icon: Icon(
                  IconData(0xee35, fontFamily: 'MaterialIcons'),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFFF9800),
          onPressed: () {},
        ),
        key: _scaffoldKey,

        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon:Icon(IconData(0xeff6, fontFamily: 'MaterialIcons')),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
          title: new Text('Generation'),
          backgroundColor: Color(0xFFFF9800),
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
                Text("Generate Your ", style: TextStyle(fontSize: 30, color:Color(0xDD000000)),),
                Text("Password ", style: TextStyle(fontSize: 30, color:Color(0xDD000000)),),
                SizedBox(height: height * 0.03,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText:"Enter Your Keyword No 1"
                  ),
                  validator: (keyword1){
                    if(keyword1!.isEmpty ){
                      return 'Please enter your keyword number 1';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.01,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText:"Enter Your Keyword No 2"
                  ),
                  validator: (keyword1){
                    if(keyword1!.isEmpty ){
                      return 'Please enter your keyword number 1';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 5.0,
                  width: 5.0,
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      child: Checkbox(
                        checkColor: Color(0xDD000000),
                        value: agree,
                        onChanged: (value){
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                    ),
                    const Text(
                      'I Agree Terms and Conditions',
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(35),
                  child: FlatButton(
                    child: Text('Generate Password', style: TextStyle(fontSize: 20.0),),
                    color: Color(0xFFFF9800),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

//IconData(0xe8b5, fontFamily: 'MaterialIcons')
}