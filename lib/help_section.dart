import 'package:flutter/material.dart';

class HelpSection extends StatefulWidget {
  HelpSection({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HelpSectionState();
}

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

List<HelpItem> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return HelpItem(
      headerValue: 'Ayuda $index',
      expandedValue: 'Sección $index',
    );
  });
}

class HelpSectionState extends State<HelpSection> {
  List <HelpItem> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
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
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('Para borrar este panel, toca el icono de basura'),
            trailing: Icon(Icons.delete),
            onTap: () {
              setState(() {
                _data.removeWhere((currentItem) => item == currentItem);
              });
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}