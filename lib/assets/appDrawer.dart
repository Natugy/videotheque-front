import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Center(
              child: Text("Menu",
              style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          ListTile(
            title: const Text("Vidéotheque"),
            onTap: () {
              Navigator.pushNamed(context,'/');
            },
          ),
          ListTile(
            title: const Text("Favorite"),
            onTap: () {
              Navigator.pushNamed(context,'/favorite');
            },
          ),
        ],
      ),
    );
  }
}

