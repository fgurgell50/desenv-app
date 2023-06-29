import 'package:flutter/material.dart';
import '../models/despesa.dart';
import '../repositories/despesa_repository.dart';
import '../widgets/despesas_listview.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _despesaRepository = DespesaRepository();
  final _valorDespesaController = TextEditingController();
  final _descricaoDespesaController = TextEditingController();
  List<Despesa> _despesas = [];
  late Future<List<Despesa>> _despesasFuture = _despesaRepository.getDespesas().then((despesas) {
    setState(() {
      // alterar o estado da aplicação
      _despesas = despesas;
    });
    return despesas;
  });

  @override
  void dispose() {
    _valorDespesaController.dispose();
    _descricaoDespesaController.dispose();
    super.dispose();
  }

  void _cadastrarTarefa() {
    if (_valorDespesaController.text.isEmpty || _descricaoDespesaController.text.isEmpty) {
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
    String valorText = _valorDespesaController.text;
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

  final novaDespesa = Despesa(
    valor: valor,
    descricao: _descricaoDespesaController.text,
    data: DateTime.now(),
  );


    setState(() {
      _despesas.add(novaDespesa);
      _valorTotal += novaDespesa.valor;
    });

    _despesaRepository.saveDespesas(_despesas);

    _valorDespesaController.text = '';
    _descricaoDespesaController.text = '';

    print('Valor Total: ${_despesas.length}');
  }

  void _removerDespesa(int index) {
    setState(() {
   //   _valorTotal -= _tarefas[index].valor;
      _despesas.removeAt(index);
    });
    _despesaRepository.saveDespesas(_despesas);
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
                  controller: _descricaoDespesaController,
                  decoration: const InputDecoration(hintText: 'Descrição da Despesa'),
                ),
                TextFormField(
                  controller: _valorDespesaController,
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
            child: FutureBuilder<List<Despesa>>(
              future: _despesasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar tarefas'));
                } else if (snapshot.data?.isEmpty ?? true) {
                  return const Center(child: Text('Nenhuma tarefa cadastrada'));
                } else {
                  return DespesasListView(despesas: _despesas, removerDespesa: _removerDespesa);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
