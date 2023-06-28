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
    return tarefas.isNotEmpty
        ? ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (ctx, index) {
              final tarefa = tarefas[index];
              return Card(
                elevation: 5,
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
                              tarefa.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              tarefa.descricao,
                              style: const TextStyle(
                                fontSize: 12,
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
              );
            },
          )
        : const Center(child: Text('Nenhuma tarefa cadastrada'));
  }
}
