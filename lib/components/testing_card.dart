import 'package:flutter/material.dart';
import 'package:market_flutter/models/products.dart';

class TestCardTile extends StatelessWidget {
  final Products produtos;

  const TestCardTile(this.produtos);

  @override
  Widget build(BuildContext context) {
    final nome = produtos.productName;
    final foto = produtos.productPhoto;
    final valor = produtos.valor.toString();

    return Card(
      elevation: 1,
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.green[200],
            //leading: avatar,
            title: Center(child: Text(nome, style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),)),
            //subtitle: Text(produtos.valor),
          ),
          Container(
            height: 150,
            child: Image.network(foto),
          ),
          Stack(
            children: [
              Container(
                color: Colors.white,
                child: ButtonBar(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[100],
                        onPrimary: Colors.black,
                      ),
                        onPressed: () {}, child: Text("Adicionar ao carrinho")
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23, left: 15),
                child: Text('R\$ $valor', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}
