import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
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
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Perfil'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/user');
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: const Text('Meus Anúncios'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/ads');
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Transações'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/transactions');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Criar Anúncio'),
          onTap: () {
            _showCreateAdModal(context);
          },
        ),
      ],
    );
  }

  void _showCreateAdModal(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    String status = 'available';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Criar Novo Anúncio'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título do Anúncio',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição do Anúncio',
                  ),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Preço',
                  ),
                  keyboardType: TextInputType.number,
                ),
                DropdownButtonFormField<String>(
                  value: status,
                  items: const [
                    DropdownMenuItem(
                      value: 'available',
                      child: Text('Available'),
                    ),
                    DropdownMenuItem(
                      value: 'sold',
                      child: Text('Sold'),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      status = newValue;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Criar'),
              onPressed: () {
                // Capturando os valores dos campos
                final Map<String, dynamic> newAd = {
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                  'id': DateTime.now().millisecondsSinceEpoch, // Gerando ID único
                  'status': status,
                };

                // Aqui você pode enviar os dados para uma API ou adicioná-los a uma lista de anúncios
                print("Anúncio criado: $newAd");

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
