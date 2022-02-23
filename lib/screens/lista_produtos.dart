import 'package:flutter/material.dart';
import 'package:market_flutter/components/drawer.dart';
import 'package:market_flutter/components/testing_card.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:provider/provider.dart';

import 'meu_carrinho.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Produtos produtos = Provider.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            height: 40,
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.green,
              ),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Procure um produto',
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
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
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.access_alarm), text: 'Ofertas'),
              Tab(icon: Icon(Icons.add_location), text: 'Endereço'),
              Tab(icon: Icon(Icons.settings), text: 'Opções'),
            ],
          ),
        ),
        drawer: buildDrawer(context),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: produtos.count,
              itemBuilder: (context, i) => TestCardTile(produtos.byIndex(i)),
            ),
            ListView.builder(
              itemCount: produtos.count,
              itemBuilder: (context, i) => TestCardTile(produtos.byIndex(i)),
            ),
            Tab(
              text: 'Aqui vem o endereço',
            ),
            Tab(text: 'aqui vem o settings?'),
          ],
        ),
      ),
    );
  }
}
