import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;


class DatabaseManager {

  bool initialized = false;
  Database database;

  final List<String> columnsGeneralSection = ['Subproducto', 'Institucion', 'Producto', 'CAT', 'ValorVivienda'];
  final Map<int, String> destinosById = {
    0: 'Adquisición de Vivienda',
    1: 'Adquisición de terreno',
    2: 'Construcción de vivienda',
    3: 'Mejoras(apliacion, remodelación)',
    4: 'Pago de pasivos',
  };
  final Map<int, String> incomeSelectorById = {
    0: 'IngresosRequeridos<=10000',
    1: 'IngresosRequeridos BETWEEN 10000 AND 20000',
    2: 'IngresosRequeridos BETWEEN 20000 AND 30000',
    3: 'IngresosRequeridos>=30000',
  };
  final Map<int, int> plazosById = {
    0: 60,
    1: 84,
    2: 120,
    3: 180,
    4: 240,
  };

  Future<void> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'asset_credito.db');
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join(('assets'), 'credito.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
    database = await openDatabase(
      join(directory.path, 'asset_credito.db'),
      version: 1,
    );
    initialized = true;
  }

  Future<List<Subproducto>> subproductos(int destino, int ingresos, int plazo, String orderedBy) async {
    if(!initialized) await initializeDatabase();
    String destinoName = destinosById[destino];
    int plazoMonths = plazosById[plazo];
    final List<Map<String, dynamic>> maps = await database.query(
      'ResumenSubproductos',
      columns: columnsGeneralSection,
      where: '${incomeSelectorById[ingresos]} AND Destino=? AND Plazo=?',
      whereArgs: [destinoName, plazoMonths],
      orderBy: orderedBy,
    );
    return List.generate(maps.length, (i) {
      return Subproducto(
        id: maps[i]['Subproducto'],
        institucion: maps[i]['Institucion'],
        producto: maps[i]['Producto'],
        valorVivienda: maps[i]['ValorVivienda'],
        cat: maps[i]['CAT'],
      );
    });
  }
}

class Subproducto {
  final int id;
  final String institucion;
  final String producto;
  final String destino;
  final String moneda;
  final int valorVivienda;
  final double aforo;
  final int plazo;
  final double ingresosRequeridos;
  final double tasaInteres;
  final String tipoTasa;
  final double cat;
  final bool catIncluyeIVA;
  final double pago;
  final String frecuenciaPago;
  final double avaluo;
  final double comisionPorApertura;
  final double gastosNotariales;
  final double desembolsoInicial;

  Subproducto({
    this.id,
    this.institucion,
    this.producto,
    this.destino,
    this.moneda,
    this.valorVivienda,
    this.aforo,
    this.plazo,
    this.ingresosRequeridos,
    this.tasaInteres,
    this.tipoTasa,
    this.cat,
    this.catIncluyeIVA,
    this.pago,
    this.frecuenciaPago,
    this.avaluo,
    this.comisionPorApertura,
    this.gastosNotariales,
    this.desembolsoInicial,
  });
}