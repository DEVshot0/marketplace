import 'package:flutter/material.dart';
import '../widgets/base_screen.dart'; // Importando o BaseScreen

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  // Método para obter a saudação com base no horário de Brasília
  String getGreeting() {
    // Ajuste do horário para o fuso horário de Brasília (UTC-3)
    final now = DateTime.now().toUtc().add(const Duration(hours: -3));
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Bom dia';
    } else if (hour >= 12 && hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Perfil do Usuário',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Avatar do usuário
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'), // Substitua pelo caminho da imagem do avatar
              backgroundColor: Colors.blueGrey,
            ),
            const SizedBox(height: 20),

            // Saudação personalizada com base no horário de Brasília
            Text(
              '${getGreeting()}, Nome do Usuário!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            // Botão para voltar à Home
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
