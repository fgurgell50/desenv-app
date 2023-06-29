import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/despesa.dart';

class DespesasListView extends StatelessWidget {
  final List<Despesa> despesas;
  final void Function(int index) removerDespesa;

  const DespesasListView({Key? key, required this.despesas, required this.removerDespesa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalDespesas = despesas.length;
    final valorTotal = despesas.fold(0.0, (double previousValue, Despesa despesa) => previousValue + despesa.valor);

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
          child: despesas.isNotEmpty
              ? ListView.builder(
                  itemCount: despesas.length,
                  itemBuilder: (ctx, index) {
                    final tarefa = despesas[index];
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
                                  onPressed: () => removerDespesa(index),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('Nenhuma Despesa cadastrada')),
        ),
      ],
    );
  }
}
