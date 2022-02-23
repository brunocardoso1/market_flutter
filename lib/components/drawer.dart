import 'package:flutter/material.dart';
import 'package:market_flutter/routes/app_routes.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
      child: ListView(
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.green[300],
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 40, color: Colors.green[800]),
              text: '4',
              children: [
                TextSpan(text: 'Health', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                TextSpan(text: '\n your favorite market!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15))
              ]
            ),
          ),
        )
      ),
      Container(
        color: Colors.green[100],
        height: 1000,
        child: Column(
          children: [
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
        ),
      )
    ],
  ));
}
