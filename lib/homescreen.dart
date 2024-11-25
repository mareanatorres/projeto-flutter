import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'task.dart'; // Importa a página de tarefas
import 'calendarpage.dart'; // Importa a página de calendário
import 'login.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Função para fazer logout
  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mensagem de boas-vindas
            Text(
              'Bem-vindo, ${'Mariana Torres. RA: 1153216'}!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // Botão para ir ao calendário
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CalendarScreen()), // Navega para o calendário
                );
              },
              child: Text('Ir para o calendário'),
            ),
            SizedBox(height: 20),
            // Botão para ir à lista de tarefas
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TaskPage()), // Navega para a lista de tarefas
                );
              },
              child: Text('Ir para a lista de tarefas'),
            ),
          ],
        ),
      ),
    );
  }
}
