import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Nome de Usuário'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação para registrar (por enquanto, só navega para Home)
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Registrar'),
            ),
            TextButton(
              onPressed: () {
                // Volta para a tela de login
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Já tem uma conta? Faça login'),
            ),
          ],
        ),
      ),
    );
  }
}
