import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: Text('Esta é a segunda página'),
      ),
    );
  }
}
