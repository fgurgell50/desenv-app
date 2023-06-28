import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  final List<Item> items = [
    Item('Item 1', 'Description 1', 'Responsável 1'),
    Item('Item 2', 'Description 2', 'Responsável 2'),
    Item('Item 3', 'Description 3', 'Responsável 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Segunda Página'),
      ),*/
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index].endereco ?? '', // Provide a default value if endereco is null
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index].responsavel,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String endereco;
  final String responsavel;

  Item(this.title, this.endereco, this.responsavel);
}
