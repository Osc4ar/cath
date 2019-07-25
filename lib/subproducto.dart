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