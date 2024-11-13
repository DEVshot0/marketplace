import 'package:flutter/material.dart';
import 'register_screen.dart';  // Importando a tela de registro

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                // Navega para a tela principal após login (simulado)
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navega para a tela de registro
                Navigator.pushReplacementNamed(context, '/register');
              },
              child: const Text('Ainda não tem uma conta? Registre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
