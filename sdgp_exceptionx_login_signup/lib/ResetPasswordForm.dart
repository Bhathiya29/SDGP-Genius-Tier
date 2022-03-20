import 'package:flutter/material.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildInputForm('Email', false),
      ],
    );
  }

  Padding buildInputForm(String label, bool password) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
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
        ),
      ),
    );
  }
}
