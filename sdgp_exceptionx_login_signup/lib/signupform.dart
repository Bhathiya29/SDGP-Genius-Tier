import 'package:flutter/material.dart';

class signupform extends StatefulWidget {
  @override
  _signupformState createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Name', false),
        buildInputForm('Email', false),
        buildInputForm('Password', true),
        buildInputForm('Confirm Password', true),
      ],
    );
  }

  Padding buildInputForm(String label, bool password) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextFormField(
        obscureText: password ? _isObscure : false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.blueGrey[800],
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          suffixIcon: password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: _isObscure
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.blueGrey[800],
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.blueGrey[800],
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
