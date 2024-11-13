import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/user_screen.dart';
import 'screens/ads_screen.dart';
import 'screens/register_screen.dart';
import 'screens/transactions_screen.dart'; // Importando a tela de transações
import 'widgets/menu_items.dart'; // Importando o menu

void main() {
  runApp(const MyApp());
}

// A classe MyApp que define o MaterialApp e as rotas
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/user': (context) => const UserScreen(),
        '/ads': (context) => const AdsScreen(),
        '/register': (context) => const RegisterScreen(),
        '/transactions': (context) => const TransactionsScreen(), // Rota para a tela de transações
      },
    );
  }
}

// A classe BaseScreen que pode ser usada por outras telas para incluir o Drawer (menu lateral)
class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const Drawer(
        child: MenuItems(), // Usa o MenuItems como menu lateral
      ),
      body: child, // Exibe a tela fornecida para o corpo do Scaffold
    );
  }
}
