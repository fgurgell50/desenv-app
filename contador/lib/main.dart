import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Column, EdgeInsets, ElevatedButton, MainAxisAlignment, Padding, Scaffold, SizedBox, StatelessWidget, Text, TextStyle, Widget;

class HomePage extends StatelessWidget {
  final int contador;
  final void Function() incrementar;

  const HomePage({super.key, required this.contador, required this.incrementar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador'),
        ),
        body: Center(          
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Você clicou $contador vezes', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: incrementar,
                  child: const Text('+', style: TextStyle(fontSize: 20))
                )                  
              ],
            ),
          ),
        )
      );
  }
}