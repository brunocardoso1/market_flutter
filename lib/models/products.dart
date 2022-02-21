import 'package:flutter/material.dart';

class Products {
  final String id;
  final String productName;
  final String valor;
  final String productPhoto;

  const Products( {
    this.id,
    @required this.productName,
    @required this.valor,
    @required this.productPhoto,
  });

}