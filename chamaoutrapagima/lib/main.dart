import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MeuApp(),
        );
      },
    ),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela com Botão'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SegundaPagina(),
              ),
            );
          },
          child: Text('Abrir segunda página'),
        ),
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: Text('Conteúdo da segunda página'),
      ),
    );
  }
}
