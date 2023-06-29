import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefa.dart';

class TarefaRepository {
  SharedPreferences? sharedPreferences;
  // cache chave e valor
  Future<SharedPreferences> getSharedPreferencesInstance() async {
    if (sharedPreferences != null) {
      return sharedPreferences!;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    }
  }

  Future<List<Tarefa>> getTarefas() async {// Future pq é assincrno
    final prefs = await getSharedPreferencesInstance();
    //criar a instancia
    final jsonString = prefs.getString('tarefas_list') ?? '[]'; // caso retonr nulo retrona uma []
    final List<dynamic> parsed = jsonDecode(jsonString); 
    // se retornar o Json e vamos abrir com jsonDecode que transforma em map
    return parsed.map<Tarefa>((json) => Tarefa.fromJson(json)).toList();
    // retorna uma lista de tarefas
  }

  Future<void> saveTarefas(List<Tarefa> tarefas) async {
    // lista de tarefas converter para Json e salvar no cache
    final prefs = await getSharedPreferencesInstance();
    //criar a instancia
    final jsonString = jsonEncode(tarefas);
    //passar a lista de tarefas e codifica para Json
    prefs.setString('tarefas_list', jsonString);
    //setar a lista de tarefas
  }

  Future<void> removeTarefas() async {
    final prefs = await getSharedPreferencesInstance();
    //cria a instancia
    prefs.remove('tarefas_list');
  }
}
