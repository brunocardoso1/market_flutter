import 'package:flutter/material.dart';
import 'package:market_flutter/provider/produto.dart';
import 'package:market_flutter/routes/app_routes.dart';
import 'package:market_flutter/screens/lista_produtos.dart';
import 'package:market_flutter/screens/registrar_produtos.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Produtos(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        routes: {
          AppRoutes.HOME: (_) => ProductList(),
          AppRoutes.PRODUCT_FORM: (_) => RegistrarProdutos(),
        },
      ),
    );
  }
}
