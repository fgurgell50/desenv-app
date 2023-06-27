import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: PaginaInicial(),
      routes: {
        '/pagina1': (context) => Pagina1(),
        '/pagina2': (context) => Pagina2(),
        '/pagina3': (context) => Pagina3(),
      },
    );
  }
}

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Página Inicial'),
      ),
      drawer: Drawer(
        child: ListView(
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
              title: Text('Página 1'),
              onTap: () {
                Navigator.pushNamed(context, '/pagina1');
              },
            ),
            ListTile(
              title: Text('Página 2'),
              onTap: () {
                Navigator.pushNamed(context, '/pagina2');
              },
            ),
            ListTile(
              title: Text('Página 3'),
              onTap: () {
                Navigator.pushNamed(context, '/pagina3');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da página inicial'),
      ),
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: Center(
        child: Text('Conteúdo da página 1'),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Text('Conteúdo da página 2'),
      ),
    );
  }
}

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3'),
      ),
      body: Center(
        child: Text('Conteúdo da página 3'),
      ),
    );
  }
}


