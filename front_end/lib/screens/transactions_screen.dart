import 'package:flutter/material.dart';
import '../widgets/base_screen.dart'; // Importa BaseScreen para usar o menu compartilhado

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Transações',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aqui serão exibidas as transações do usuário.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
