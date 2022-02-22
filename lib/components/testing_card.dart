import 'package:flutter/material.dart';
import 'package:market_flutter/models/products.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:market_flutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

class TestCardTile extends StatelessWidget {
  final Products produtos;

  const TestCardTile(this.produtos);

  @override
  Widget build(BuildContext context) {
    final avatar =
        produtos.productPhoto == null || produtos.productPhoto.isEmpty
            ? CircleAvatar(child: Icon(Icons.person))
            : CircleAvatar(
                backgroundImage: NetworkImage(produtos.productPhoto),
              );

    return ListView(children: [
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
      ),
      ListTile(
        leading: avatar,
        title: Text(produtos.productName),
        subtitle: Text(produtos.valor),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCT_FORM,
                    arguments: produtos,
                  );
                },
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Excluir usuario"),
                              content: Text('Tem Certeza?'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text('Não')),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: Text('Sim')),
                              ],
                            )).then((confirmed) {
                      if (confirmed) {
                        Provider.of<Produtos>(context).remove(produtos);
                      }
                    });
                    Provider.of<Produtos>(context, listen: false)
                        .remove(produtos);
                  }),
            ],
          ),
        ),
      ),
    ]);
  }
}
