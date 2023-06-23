import 'package:flutter/material.dart';

void main() => runApp(ContadorApp());

// 1 - Alterar de StatelessWidget para StatefulWidget (Essa classe terá a função de criar o estado)
class ContadorApp extends StatefulWidget {

  // 3 - Criar método para criar o estado
  @override
  ContadorAppState createState() {
    return ContadorAppState();
  }
}

// 2 - Criar classe que irá herdar de State e passar toda implementação para cá
class ContadorAppState extends State<ContadorApp> {
  int contador = 0;
  int diminui  = 0;

  void incrementar() {
    // 4 - Colocar variável que mudará de valor de forma reativa dentro de um setState
    setState(() {
      contador++;
    }); 
    print('O contador agora é $contador');
  }

  void diminuir() {
    // 4 - Colocar variável que mudará de valor de forma reativa dentro de um setState
    setState(() {
      contador--;
    }); 
    print('O contador agora é $contador');
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('APP CONTADOR'),
        ),
        backgroundColor: Color.fromARGB(255, 193, 226, 254),
        body: Center(          
         child: Padding(
           padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('CONTADOR', 
                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                     SizedBox(height: 60),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('Você clicou $contador vezes', 
                     style: const TextStyle(fontSize: 20, 
                     fontWeight: FontWeight.bold
                     )
                     ),
                     // const SizedBox(height: 60),
                  ],
                ),
               const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(width: 80),
                    ElevatedButton(
                    onPressed: contador < 1 ? null : diminuir ,
                    child: const Text(
                    '-',
                    style: TextStyle(fontSize: 20) ,
                    textAlign: TextAlign.right,   
                  )
                 ),
                    SizedBox(width: 60),
                    ElevatedButton(
                    onPressed: incrementar ,
                    child: const Text('+', style: TextStyle(fontSize: 20))
                    ),
                  ],
                ),  
              ],
            ),
         ),
        )
      )
    );
  }

}