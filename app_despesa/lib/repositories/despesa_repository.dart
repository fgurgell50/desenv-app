import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/despesa.dart';

class DespesaRepository {
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

  Future<List<Despesa>> getDespesas() async {// Future pq é assincrno
    final prefs = await getSharedPreferencesInstance();
    //criar a instancia
    final jsonString = prefs.getString('despesas_list') ?? '[]'; // caso retonr nulo retrona uma []
    final List<dynamic> parsed = jsonDecode(jsonString); 
    // se retornar o Json e vamos abrir com jsonDecode que transforma em map
    return parsed.map<Despesa>((json) => Despesa.fromJson(json)).toList();
    // retorna uma lista de despesas
  }

  Future<void> saveDespesas(List<Despesa> despesas) async {
    // lista de despesas converter para Json e salvar no cache
    final prefs = await getSharedPreferencesInstance();
    //criar a instancia
    final jsonString = jsonEncode(despesas);
    //passar a lista de tarefas e codifica para Json
    prefs.setString('despesas_list', jsonString);
    //setar a lista de tarefas
  }

  Future<void> removeDespesas() async {
    final prefs = await getSharedPreferencesInstance();
    //cria a instancia
    prefs.remove('despesas_list');
  }
}
