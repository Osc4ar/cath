import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {

  final String _text;
  final Color _color;

  AppHeader(this._text, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1.5,
            spreadRadius: 1.5,
            offset: Offset(
              0.1,
              0.1,
            )
          )
        ],
        color: _color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(
              _text,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}