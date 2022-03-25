import 'package:flutter/material.dart';

class checkBox extends StatefulWidget {
  @override
  _checkBoxState createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
