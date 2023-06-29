import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tarefa.dart';

class TarefasListView extends StatelessWidget {
  final List<Tarefa> tarefas;
  final void Function(int index) removerTarefa;

  const TarefasListView({Key? key, required this.tarefas, required this.removerTarefa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalTarefas = tarefas.length;
    final valorTotal = tarefas.fold(0.0, (double previousValue, Tarefa tarefa) => previousValue + tarefa.valor);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Valor Total: R\$ ${valorTotal.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ),
        Divider(),
        Expanded(
          child: tarefas.isNotEmpty
              ? ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (ctx, index) {
                    final tarefa = tarefas[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  DateFormat('dd/MM/yyyy HH:mm').format(tarefa.data),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'R\$' + ' '+ tarefa.valor.toStringAsFixed(2),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      tarefa.descricao,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 121, 121, 121),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removerTarefa(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('Nenhuma tarefa cadastrada')),
        ),
      ],
    );
  }
}
