import 'package:flutter/material.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Tap Tycoon",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Drawer Items
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/homescreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Shop"),
            onTap: () {
              Navigator.pushNamed(context, '/shop');
            },
          ),
        ],
      ),
    );
  }
}
