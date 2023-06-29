import 'dart:ffi';

class Despesa {
  final double valor;
  final String descricao;
  final DateTime data;

  Despesa({required this.valor, required this.descricao, required this.data});
  
  factory Despesa.fromJson(Map<String, dynamic> json) {
    return Despesa(
      valor: json['valor'],
      descricao: json['descricao'],
      data: DateTime.parse(json['data'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "valor": this.valor,
      "descricao": this.descricao,
      "data": this.data.toString()
    };
  }
}