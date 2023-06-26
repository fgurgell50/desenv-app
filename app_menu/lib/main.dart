import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  int _selectedIndex = 0;

  List<Widget> _paginas = [
    PaginaInicial(),
    Pagina1(),
    Pagina2(),
    Pagina3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Página Principal'),
          ),
          body: _paginas[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pageview),
                label: 'Página 1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages),
                label: 'Página 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Página 3',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Conteúdo da página inicial'),
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Conteúdo da página 1'),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Conteúdo da página 2'),
    );
  }
}

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Conteúdo da página 3'),
    );
  }
}
