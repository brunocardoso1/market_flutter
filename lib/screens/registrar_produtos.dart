import 'package:flutter/material.dart';
import 'package:market_flutter/models/products.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:provider/provider.dart';

class RegistrarProdutos extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormDate(Products produto) {
    if (produto != null) {
      _formData['id'] = produto.id;
      _formData['productName'] = produto.productName;
      _formData['valor'] = produto.valor;
      _formData['productPhoto'] = produto.productPhoto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Products produto = ModalRoute.of(context).settings.arguments;

    _loadFormDate(produto);

    return Scaffold(
      appBar: AppBar(
        title: Text("Registre os produtos"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();
                if (isValid || !isValid) {
                  _form.currentState.save();
                  Provider.of<Produtos>(context, listen: false).put(
                    Products(
                      id: _formData['id'],
                      productName: _formData['productName'],
                      valor: _formData['valor'],
                      productPhoto: _formData['productPhoto'],
                    ),
                  );
                  Navigator.of(context).pop();
                }
              }),
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['productName'],
                decoration: InputDecoration(
                  labelText: "Nome do produto",
                ),
                /*validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome do Produto';
                  }

                  if (value.trim().length <= 1) {
                    return 'Nome muito pequeno. No minimo 1 letras.';
                  }

                  return null;
                },*/
                onSaved: (value) => _formData['productName'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Valor do produto",
                ),
                onSaved: (value) => _formData['valor'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Url da foto do produto",
                ),
                onSaved: (value) => _formData['productPhoto'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
