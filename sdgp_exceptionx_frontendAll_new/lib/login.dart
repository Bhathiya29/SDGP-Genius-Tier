import 'package:flutter/material.dart';
import 'package:genius_tier/signup.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'ResetPasswordPage.dart';
import 'generation.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;

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
                              builder: (context) => const HomePage()));
                    },
                    icon: const Icon(
                      //IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Color(0xEE202468),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 43,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontFamily: 'Volkhov-Bold',
                  fontWeight: FontWeight.w900,
                  //fontWeight: FontWeight.bold,
                  fontSize: 43,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Login to your account",
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  color: Colors.grey[700],
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(
                height: 20.5,
              ),
              //LogInForm(),
              TextField(
                controller: controllerUsername,
                enabled: !isLoggedIn,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey[800],
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerPassword,
                enabled: !isLoggedIn,
                obscureText: true,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey[800],
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordPage(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: isLoggedIn ? null : () => doUserLogin(),
                  //defining the shape
                  color: const Color(0xEE4950E2),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New to this app?",
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
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFFF9D4E),
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      //signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
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

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!");
      setState(() {
        isLoggedIn = true;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => generationPage()));
    } else {
      showError(response.error!.message);
    }
  }
}
