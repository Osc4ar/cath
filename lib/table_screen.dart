import 'package:cath/db_manager.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  static const routeName = '/tableScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DETALLES'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('Producto 1')),
            DataColumn(label: Text('Producto 2')),
            DataColumn(label: Text('Producto 3')),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(Text('CAT')),
                DataCell(Text('11.0%')),
                DataCell(Text('10.2%')),
                DataCell(Text('13.1%')),
              ],
          ),
          ]
        ),
      ),
    );
  }
}