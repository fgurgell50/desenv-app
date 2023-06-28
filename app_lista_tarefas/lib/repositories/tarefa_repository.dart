import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefa.dart';

class TarefaRepository {
  SharedPreferences? sharedPreferences;

  Future<SharedPreferences> getSharedPreferencesInstance() async {
    if (sharedPreferences != null) {
      return sharedPreferences!;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    }
  }

  Future<List<Tarefa>> getTarefas() async {
    final prefs = await getSharedPreferencesInstance();
    final jsonString = prefs.getString('tarefas_list') ?? '[]';
    final List<dynamic> parsed = jsonDecode(jsonString);
    return parsed.map<Tarefa>((json) => Tarefa.fromJson(json)).toList();
  }

  Future<void> saveTarefas(List<Tarefa> tarefas) async {
    final prefs = await getSharedPreferencesInstance();
    final jsonString = jsonEncode(tarefas);
    prefs.setString('tarefas_list', jsonString);
  }

  Future<void> removeTarefas() async {
    final prefs = await getSharedPreferencesInstance();
    prefs.remove('tarefas_list');
  }
}
