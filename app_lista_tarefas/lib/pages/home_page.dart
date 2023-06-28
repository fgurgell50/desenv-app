import 'package:flutter/material.dart';
import '../widgets/tarefas_listview.dart';
import '../models/tarefa.dart';
import '../repositories/tarefa_repository.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tarefaRepository = TarefaRepository();
  final _nomeTarefaController = TextEditingController();
  final _descricaoTarefaController = TextEditingController();
  List<Tarefa> _tarefas = [];
  late Future<List<Tarefa>> _tarefasFuture;

  @override
  void initState() {
    super.initState();

    _tarefasFuture = _tarefaRepository.getTarefas().then((tarefas) {
      setState(() {
        _tarefas = tarefas;
      });
      return tarefas;
    });
  }

  void _cadastrarTarefa(BuildContext context) {
    if (_nomeTarefaController.text.isEmpty || _descricaoTarefaController.text.isEmpty) return;

    final novaTarefa = Tarefa(
      nome: _nomeTarefaController.text,
      descricao: _descricaoTarefaController.text,
      data: DateTime.now(),
    );

    setState(() {
      _tarefas.add(novaTarefa);
    });

    _tarefaRepository.saveTarefas(_tarefas);

    _nomeTarefaController.text = '';
    _descricaoTarefaController.text = '';

    print('Total de tarefas: ${_tarefas.length}');

    Navigator.pop(context);
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
    _tarefaRepository.saveTarefas(_tarefas);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeTarefaController,
                decoration: const InputDecoration(hintText: 'Nome da tarefa'),
              ),
              TextFormField(
                controller: _descricaoTarefaController,
                decoration: const InputDecoration(hintText: 'Descrição da tarefa'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => _cadastrarTarefa(context),
              child: const Text('Cadastrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: FutureBuilder<List<Tarefa>>(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
