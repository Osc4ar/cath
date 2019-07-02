import 'package:flutter/material.dart';

class DestinosButton extends StatelessWidget {

  final String _title;
  final Function _handler;

  DestinosButton(this._title, this._handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 300,
      child: RaisedButton(
        onPressed: _handler,
        padding: EdgeInsets.all(15.0),
        color: Color(0xFF036977),
        child: Text(
          _title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}