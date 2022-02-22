
import 'package:flutter/material.dart';
import 'package:market_flutter/routes/app_routes.dart';
import 'package:market_flutter/screens/ofertas.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ofertas()));
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
  );
}