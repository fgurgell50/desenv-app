import 'package:flutter/material.dart';
import 'primeira_pagina.dart';
import 'segunda_pagina.dart';
import 'terceira_pagina.dart';

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

  List<bool> _isSubMenuOpen = [false, false, false]; // Track o estado do submenu

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleSubMenu(int index) {
    setState(() {
      _isSubMenuOpen[index] = !_isSubMenuOpen[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color.fromARGB(255, 156, 157, 159),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
              selected: _selectedIndex == 0,
              tileColor: _selectedIndex == 0 ? Colors.grey : null,
            ),
            ExpansionTile(
              title: Text(
                'Segunda Página',
                style: TextStyle(
                  color: _isSubMenuOpen[1] ? Colors.grey : null,
                ),
              ),
              onExpansionChanged: (isOpen) {
                _toggleSubMenu(1);
              },
              tileColor: _isSubMenuOpen[1] ? Colors.grey : null,
              collapsedTextColor: _isSubMenuOpen[1] ? Colors.white : null,
              children: [
                ListTile(
                  title: Text('Subitem 1'),
                  onTap: () {
                    Navigator.pop(context);
                    _onItemTapped(1);
                  },
                  selected: _selectedIndex == 1,
                  tileColor: _selectedIndex == 1 ? Colors.grey : null,
                ),
                ListTile(
                  title: Text('Subitem 2'),
                  onTap: () {
                    Navigator.pop(context);
                    _onItemTapped(1);
                  },
                  selected: _selectedIndex == 1,
                  tileColor: _selectedIndex == 1 ? Colors.grey : null,
                ),
              ],
            ),
            ListTile(
              title: Text('Terceira Página'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
              selected: _selectedIndex == 2,
              tileColor: _selectedIndex == 2 ? Colors.grey : null,
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
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.pageview),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
