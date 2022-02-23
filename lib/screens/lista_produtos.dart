import 'package:flutter/material.dart';
import 'package:market_flutter/components/drawer.dart';
import 'package:market_flutter/components/item_card.dart';
import 'package:market_flutter/components/testing_card.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:provider/provider.dart';

import 'meu_carrinho.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Produtos produtos = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (MeuCarrinho())));
              },
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        drawer: buildDrawer(context),
        body: ListView.builder(
          itemCount: produtos.count,
          itemBuilder: (context, i) => TestCardTile(produtos.byIndex(i)),
        ));
  }
}
