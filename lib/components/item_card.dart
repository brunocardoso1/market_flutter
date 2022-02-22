
import 'package:flutter/material.dart';
import 'package:market_flutter/models/products.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:market_flutter/routes/app_routes.dart';

import 'package:provider/provider.dart';

class CardTile extends StatelessWidget {

  final Products produtos;

  const CardTile(this.produtos);

  @override
  Widget build(BuildContext context) {
    final avatar = produtos.productPhoto == null || produtos.productPhoto.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(produtos.productPhoto),);

    return ListTile(
      leading: avatar,
      title: Text(produtos.productName),
      subtitle: Text(produtos.valor),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
                arguments: produtos,
              );

            },
          ),
          IconButton(icon: Icon(Icons.delete), onPressed: (){
            showDialog(context: context,
                builder: (context) => AlertDialog(
                  title: Text("Excluir usuario"),
                  content: Text('Tem Certeza?'),
                  actions: [
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop(false);
                    }, child: Text('Não')),
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop(true);
                    }, child: Text('Sim')),
                  ],
                )
            ).then((confirmed){
              if(confirmed) {
                Provider.of<Produtos>(context).remove(produtos);
              }
            });
            Provider.of<Produtos>(context, listen: false).remove(produtos);
          }),
        ],),
      ),
    );
  }
}
