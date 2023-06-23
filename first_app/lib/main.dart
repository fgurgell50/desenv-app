import 'package:flutter/material.dart';

main() => runApp(const FirstApp());

class FirstApp extends StatelessWidget {
  final String title = 'Primeiro APP';

  const FirstApp({super.key});

  List<Widget> geraWidgets() {
    List<Widget> widgets = [];
    for (var i = 1; i <= 20; i++) {
      widgets.add(Container(
        //width: 100,
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
          color: Color.fromARGB(255, 102, 102, 102),
          width: 1.0,
        )),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset('assets/images/flutter.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(' Primeiro APP', 
                style: TextStyle(fontSize: 20), 
                textAlign: TextAlign.center),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text('DESENVOLVIDO PELO FREDERICO EM FLUTTER.', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'BebasNeue'),
        home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: SingleChildScrollView(
            child: Column(children: geraWidgets()),
          ),
        ),
      ),
    );
  }
}
