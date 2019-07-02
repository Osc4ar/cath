import 'package:flutter/material.dart';
import 'app_header.dart';
import 'destinos_button.dart';

class ComparatorSection extends StatefulWidget {
  ComparatorSection({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComparatorSectionState();
}

class _ComparatorSectionState extends State<ComparatorSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppHeader('COMPARADOR CRÉDITOS HIPOTECARIOS', Color(0xFF182C47)),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DestinosButton('COMPRAR CASA', () {}),
                    DestinosButton('COMPRAR TERRENO', () {}),
                    DestinosButton('CONSTRUIR', () {}),
                    DestinosButton('REMODELAR', () {}),
                    DestinosButton('CAMBIAR HIPOTECA', () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}