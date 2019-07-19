import 'package:flutter/material.dart';

class HelpEntry {
  String title;
  String content;
  HelpEntry({
    this.title,
    this.content,
  });
}

List<HelpEntry> entries = [
  HelpEntry(
    title: '¿Qué es el destino de un crédito hipotecario?',
    content: 'El destino de un crédito se refiere al objetivo que se realizará con el dinero solicitado.'
  ),
  HelpEntry(
    title: '¿En qué influyen mis ingresos para obtener un crédito?',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: '¿Qué es el CAT de un crédito?',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: '¿Cuál es la diferencia de tasa fija y variable?',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: '¿Cuáles son los plazos comunes en créditos hipotecarios?',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: 'Título de ayuda',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: 'Título de ayuda',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: 'Título de ayuda',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: 'Título de ayuda',
    content: 'Contenido de ayuda.'
  ),
  HelpEntry(
    title: 'Título de ayuda',
    content: 'Contenido de ayuda.'
  ),
];

class HelpItem {
  HelpItem({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<HelpItem> generateItems() {
  return List.generate(entries.length, (int index) {
    return HelpItem(
      headerValue: entries.elementAt(index).title,
      expandedValue: entries.elementAt(index).content,
    );
  });
}

class HelpSection extends StatefulWidget {
  HelpSection({Key key}) : super(key: key);

  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {
  List <HelpItem> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((HelpItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: TextStyle(fontSize: 20, color: Color(0xFF036977),),
              ),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}