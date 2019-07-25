import 'package:cath/db_manager.dart';
import 'package:flutter/material.dart';
import 'user_data_for_search.dart';
import 'table_screen.dart';
import 'db_manager.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/searchScreen';
  @override
  Widget build(BuildContext context) {
    final UserDataForSearch args = ModalRoute.of(context).settings.arguments;
    return ListSection(destino: args.destino, ingresos: args.ingresos, plazo: args.plazo);
  }
}

class ListSection extends StatefulWidget {
  final int destino;
  final int ingresos;
  final int plazo;
  const ListSection({Key key, this.destino, this.ingresos, this.plazo}): super(key: key);

  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  List<Subproducto> results = new List();
  List<bool> status = new List();
  int selectedItems = 0;
  DatabaseManager dbManager = DatabaseManager();
  bool _buttonIsVisible = false;
  double _valorViviendaSelected = 500000.0;
  double minValorVivienda = 0.0;
  double maxValorVivienda = 0.0;

  @override
  void initState() {
    super.initState();
    dbManager.subproductos(this.widget.destino, this.widget.ingresos, this.widget.plazo, 'Institucion').then((subproductos) {
      setState(() {
        subproductos.forEach((subproducto) {
          results.add(subproducto);
          status.add(false);
        });
      });
    });
    /*List<double> minAndMax = getMinAndMax();
    print(minAndMax);
    minValorVivienda = minAndMax[0];
    maxValorVivienda = minAndMax[1];
    _valorViviendaSelected = minAndMax[0];*/
  }

  Map<String, Color> banksColors = {
    'BBVA': Color(0xFF072146),
    'Banorte': Color(0xFFEB0029),
    'BanRegio': Color(0xFFFB6830),
    'Citibanamex': Color(0xFF056DAF),
    'HSBC': Color(0xFFE52713),
    'Inbursa': Color(0xFF012148),
    'Santander': Color(0xFFEC0000),
    'Scotiabank': Color(0xFFEC101A),
  };

  String getShortName(String longName) {
    if (longName.contains('Bancomer'))
      return 'BBVA';
    if (longName.contains('México'))
      return 'Citibanamex';
    if (longName.contains('Monterrey'))
      return 'BanRegio';
    if (longName.contains('Norte'))
      return 'Banorte';
    if (longName.contains('Inbursa'))
      return 'Inbursa';
    if (longName.contains('Scotiabank'))
      return 'Scotiabank';
    return longName;
  }

  List<double> getMinAndMax() {
    int min = results[0].valorVivienda;
    int max = results[0].valorVivienda;
    results.forEach((element) => {
      if (element.valorVivienda < min) {
        min = element.valorVivienda
      }
      else if (element.valorVivienda > max) {
        max = element.valorVivienda
      }
    });
    return <double>[min.toDouble(), max.toDouble()];
  }

  Widget _buildBankInfoTile(BuildContext context, int index) {
    String shortName = getShortName(results[index].institucion);
    Color bankColor = banksColors[shortName];
    return Card(
      child: CheckboxListTile(
        title: Text(
          shortName,
          style: TextStyle(
            color: bankColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        isThreeLine: true,
        subtitle: Text('${results[index].producto}\nValor Vivienda: \$${results[index].valorVivienda}\nCAT: ${results[index].cat}%'),
        value: status[index],
        onChanged: (bool value) {
          setState(() {
            status[index] = value;
            selectedItems = 0;
            status.forEach((state) {
              if (state)
                selectedItems++;
            });
            _buttonIsVisible = selectedItems == 3;
          });
        },
        secondary: Container(
          width: 20,
          color: bankColor,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No se encontraron resultados',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
    if (results.length > 0) {
      content = ListView.builder(
        itemBuilder: _buildBankInfoTile,
        itemCount: results.length,
      );
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  offset: Offset(
                    0.1,
                    0.1,
                  ),
                ),
              ],
              color: Color(0xFF182C47),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'SELECCIONA VALOR DE VIVIENDA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Slider(
                  min: 500000.0,
                  max: 1500000.0,
                  value: _valorViviendaSelected,
                  divisions: 9,
                  activeColor: Color(0xFF58A2C0),
                  onChanged: (newValor) {
                    setState(() {
                      _valorViviendaSelected = newValor;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: content,
          flex: 6,
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTADOS'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            tooltip: 'Ordenar por CAT',
            onPressed: () {
              results.clear();
              status.clear();
              dbManager.subproductos(this.widget.destino, this.widget.ingresos, this.widget.plazo, 'Institucion').then((subproductos) {
                setState(() {
                  subproductos.forEach((subproducto) {
                    results.add(subproducto);
                    status.add(false);
                  });
                });
              });
            },
          ),
        ],
      ),
      body: _buildContent(context),
      floatingActionButton: Visibility(
        visible: _buttonIsVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, TableScreen.routeName);
          },
          child: Icon(Icons.table_chart),
        ),
      ),
    );
  }
}