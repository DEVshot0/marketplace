import 'package:flutter/material.dart';
import '../widgets/base_screen.dart'; // Importando o BaseScreen

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Meus Anúncios',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Aqui serão exibidos os anúncios criados pelo usuário.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
