import 'package:flutter/material.dart';
import 'comparator_section.dart';
import 'help_section.dart';
import 'mortgage_by_bank_section.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BANCO DE MÉXICO',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF182C47),
        accentColor: Color(0xFF58A2C0),
        fontFamily: 'Montserrat',
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedSection = 1;
  double _appBarElevation = 0.0;

  void _onSectionSelected(int index) {
    setState(() {
      _selectedSection = index;
      _appBarElevation = index == 1 ? 0.0 : 4.0;
    });
  }

  List<Widget> _sections = <Widget>[
    MortgageByBank(),
    ComparatorSection(),
    HelpSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BANCO DE MÉXICO',
        ),
        centerTitle: true,
        elevation: _appBarElevation,
      ),
      body: Center(
        child: _sections.elementAt(_selectedSection),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('Bancos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Comparador'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('Ayuda'),
          ),
        ],
        currentIndex: _selectedSection,
        onTap: _onSectionSelected,
      ),
    );
  }
}