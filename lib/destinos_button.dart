import 'package:flutter/material.dart';

class DestinosButton extends StatefulWidget {

  String title;
  Function callback;

  DestinosButton(this.title, this.callback);

  @override
  _DestinosButtonState createState() => new _DestinosButtonState();
}

class _DestinosButtonState extends State<DestinosButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 300,
      child: RaisedButton(
        onPressed: () {
          this.widget.callback(this.widget.title);
        },
        padding: EdgeInsets.all(15.0),
        color: Color(0xFF036977),
        child: Text(
          this.widget.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}