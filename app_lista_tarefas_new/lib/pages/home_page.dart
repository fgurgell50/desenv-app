import 'package:flutter/material.dart';
import '../widgets/tarefas_listview.dart';
import '../models/tarefa.dart';
import '../repositories/tarefa_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tarefaRepository = TarefaRepository();
  final _valorTarefaController = TextEditingController();
  final _descricaoTarefaController = TextEditingController();
  List<Tarefa> _tarefas = [];
  late Future<List<Tarefa>> _tarefasFuture = _tarefaRepository.getTarefas().then((tarefas) {
    setState(() {
      // alterar o estado da aplicação
      _tarefas = tarefas;
    });
    return tarefas;
  });

  @override
  void dispose() {
    _valorTarefaController.dispose();
    _descricaoTarefaController.dispose();
    super.dispose();
  }

  void _cadastrarTarefa() {
    if (_valorTarefaController.text.isEmpty || _descricaoTarefaController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Campos vazios'),
            content: const Text('Por favor, verifique o(s) campo(s) vazio(s).'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
double valor;
double _valorTotal = 0.0;
  try {
    String valorText = _valorTarefaController.text;
    valorText = valorText.replaceAll(',', '.');
    valor = valor = double.parse(valorText);
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Valor inválido'),
          content: const Text('Por favor, verifique o valor informado.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return;
  }

  final novaTarefa = Tarefa(
    valor: valor,
    descricao: _descricaoTarefaController.text,
    data: DateTime.now(),
  );


    setState(() {
      _tarefas.add(novaTarefa);
      _valorTotal += novaTarefa.valor;
    });

    _tarefaRepository.saveTarefas(_tarefas);

    _valorTarefaController.text = '';
    _descricaoTarefaController.text = '';

    print('Valor Total: ${_tarefas.length}');
  }

  void _removerTarefa(int index) {
    setState(() {
   //   _valorTotal -= _tarefas[index].valor;
      _tarefas.removeAt(index);
    });
    _tarefaRepository.saveTarefas(_tarefas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _descricaoTarefaController,
                  decoration: const InputDecoration(hintText: 'Descrição da Despesa'),
                ),
                TextFormField(
                  controller: _valorTarefaController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      labelText: 'Valor',
                      //prefixIcon: Icon(Icons.attach_money),
                    ),
                ),
                const SizedBox(height: 8.0), // Espaço de 8 pixels abaixo dos campos de texto
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _cadastrarTarefa,
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Tarefa>>(
              future: _tarefasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar tarefas'));
                } else if (snapshot.data?.isEmpty ?? true) {
                  return const Center(child: Text('Nenhuma tarefa cadastrada'));
                } else {
                  return TarefasListView(tarefas: _tarefas, removerTarefa: _removerTarefa);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
