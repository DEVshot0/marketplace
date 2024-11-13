import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const ResponsiveScaffold({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verifica se a tela é grande ou pequena
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: isLargeScreen
          ? null
          : AppBar(
              title: Text(title),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
      drawer: isLargeScreen
          ? null
          : Drawer(
              child: MenuItems(),
            ),
      body: Row(
        children: [
          // Menu fixo para telas grandes
          if (isLargeScreen)
            Container(
              width: 200, // Largura fixa para o menu lateral
              color: Colors.grey[200],
              child: MenuItems(),
            ),
          // Corpo da tela principal
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

// Widget para os itens do menu
class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Perfil'),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag),
          title: Text('Meus Anúncios'),
          onTap: () {
            Navigator.pushNamed(context, '/ads');
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Transações'),
          onTap: () {
            Navigator.pushNamed(context, '/transactions');
          },
        ),
      ],
    );
  }
}
