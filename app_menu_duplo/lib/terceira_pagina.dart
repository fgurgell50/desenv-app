import 'package:flutter/material.dart';

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
