import 'package:flutter/material.dart';
import 'package:market_flutter/routes/app_routes.dart';
import 'package:market_flutter/screens/meu_carrinho.dart';
import 'package:market_flutter/screens/ofertas.dart';
import 'package:market_flutter/screens/registrar_produtos.dart';

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader (
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
              child: Text("4Health"),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Ofertas!'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ofertas()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Registrar Produto"),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {},
            )
          ],
        )
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.lightGreenAccent,
            child: Center(
                child: Text(
              "Bem vindo ao Supermercado 4Health!",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            shadowColor: Colors.black,
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.grey[200],
                  title: Center(
                    child: Text(
                      "Morango 400gr",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: Ink.image(
                    image: NetworkImage(
                        'https://superprix.vteximg.com.br/arquivos/ids/170267-292-292/Morango--Bandeja-.jpg?v=636094550355970000'),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Adicionar ao Carrinho",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Text("RS 19,99", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
