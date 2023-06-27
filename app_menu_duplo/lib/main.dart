import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Unidade',
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _selectedIndex = 0;

  List<Widget> _paginas = [
    PrimeiraPagina(),
    SegundaPagina(),
    TerceiraPagina(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                _onItemTapped(0); // Chama a primeira página
              },
            ),
            ListTile(
              title: Text('Segunda Página'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                _onItemTapped(1); // Chama a segunda página
              },
            ),
            ListTile(
              title: Text('Terceira Página'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                _onItemTapped(2); // Chama a terceira página
              },
            ),
          ],
        ),
      ),
      body: _paginas[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _onItemTapped(0); // Chama a primeira página
              },
            ),
            IconButton(
              icon: Icon(Icons.pageview),
              onPressed: () {
                _onItemTapped(1); // Chama a segunda página
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                _onItemTapped(2); // Chama a terceira página
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PrimeiraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Primeira Página'),
      ),*/
      body: Center(
        child: Text(
          'Conteúdo da Primeira Página',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Segunda Página'),
      ),*/
      body: Center(
        child: Text(
          'Conteúdo da Segunda Página',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TerceiraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Terceira Página'),
      ),*/
      body: Center(
        child: Text(
          'Conteúdo da Terceira Página',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
