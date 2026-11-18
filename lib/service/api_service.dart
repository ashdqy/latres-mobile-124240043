import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/character.dart';
import '../model/spell.dart';

class ApiService {
  final String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/characters'));
    final List<dynamic> result = jsonDecode(response.body);
    return result.map((item) => Character.fromJson(item)).toList();
  }

  Future<List<Spell>> fetchSpells() async {
    final response = await http.get(Uri.parse('$_baseUrl/spells'));
    final List<dynamic> result = jsonDecode(response.body);
    return result.map((item) => Spell.fromJson(item)).toList();
  }
}