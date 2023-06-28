class Tarefa {
  final String nome;
  final String descricao;
  final DateTime data;

  Tarefa({required this.nome, required this.descricao, required this.data});
  
  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      nome: json['nome'],
      descricao: json['descricao'],
      data: DateTime.parse(json['data'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": this.nome,
      "descricao": this.descricao,
      "data": this.data.toString()
    };
  }
}