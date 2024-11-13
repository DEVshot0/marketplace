import 'package:flutter/material.dart';
import 'menu_items.dart'; 

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseScreen({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: isLargeScreen
          ? null
          : AppBar(
              title: Text(title),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
      drawer: isLargeScreen
          ? null
          : Drawer(
              child: MenuItems(), // Drawer para dispositivos pequenos
            ),
      body: Row(
        children: [
          if (isLargeScreen)
            Container(
              width: 200, // Menu fixo para telas grandes
              color: Colors.grey[200],
              child: MenuItems(),
            ),
          Expanded(
            child: Column(
              children: [
                if (isLargeScreen)
                  AppBar(
                    title: Text(title),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
