import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BANXICO'),
          backgroundColor: Colors.indigo[900],
        ),
        body: ListView(
          children: <Destinos>[
            Destinos('COMPRAR CASA', Colors.yellow[900]),
            Destinos('COMPRAR TERRENO', Colors.blue[900]),
            Destinos('CONSTRUIR', Colors.green[900]),
            Destinos('REMODELAR', Colors.orange[900]),
            Destinos('CAMBIAR HIPOTECA', Colors.teal[900]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text('Destinos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Comparativo'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              title: Text('Bancos'),
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.indigo[900],
        ),
      ),
    );
  }
}

class Destinos extends StatelessWidget {
  final String _title;
  final Color _color;
  final _biggerFont = const TextStyle(
    fontSize: 22.0,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );
  
  Destinos(this._title, this._color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      height: 200.0,
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Text(
        _title,
        style: _biggerFont,
      ),
    );
  }
}
