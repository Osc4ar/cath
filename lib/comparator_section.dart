import 'package:flutter/material.dart';
import 'app_header.dart';
import 'destinos_button.dart';

class ComparatorSection extends StatefulWidget {
  ComparatorSection({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ComparatorSectionState();
}

class ComparatorSectionState extends State<ComparatorSection> {

  int _selectedSection = 0;
  int _destino = 0;
  int _ingresos;

  List<Widget> _steps = <Widget>[
    
  ];

  List<String> destinos = [
    'COMPRAR CASA',
    'COMPRAR TERRENO',
    'CONSTRUIR',
    'REMODELAR',
    'CAMBIAR HIPOTECA',
  ];

  moveToIngresos(String title) {
    setState(() {
      _destino = destinos.indexOf(title);
      _selectedSection = 1;
    });
  }

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
                    DestinosButton(destinos[0], moveToIngresos),
                    DestinosButton(destinos[1], moveToIngresos),
                    DestinosButton(destinos[2], moveToIngresos),
                    DestinosButton(destinos[3], moveToIngresos),
                    DestinosButton(destinos[4], moveToIngresos),
                    //Text('Destino: $_destino'),
                    //Text('Sección: $_selectedSection'),
                    /*Container(
                      padding: EdgeInsets.all(12.0),
                      width: 300.0,
                      child: Text(
                        '*La información relativa a comisiones que se mostrará en los cuadros corresponde a la proporcionada al Banco de México, por las Entidades Financieras Reguladas. Por lo tanto, este Instituto Central no se responsabiliza de la veracidad y/o actualización de la misma.',
                        style: TextStyle(fontSize: 10,),
                        textAlign: TextAlign.justify,
                      ),
                    ),*/
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