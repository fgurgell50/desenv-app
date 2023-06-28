import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_unidade.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 16), // Spacing between the image and the text
            Text(
              'UNIDADE EM CRISTO',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
