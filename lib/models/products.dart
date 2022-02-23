import 'package:flutter/material.dart';

class Products {
  final String id;
  final String productName;
  final bool oferta;
  final String valor;
  final String productPhoto;

  const Products( {
    this.id,
    this.oferta,
    @required this.productName,
    @required this.valor,
    @required this.productPhoto,
  });

}