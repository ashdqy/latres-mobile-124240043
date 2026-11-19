import 'package:flutter/material.dart';
import '../model/character.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.character});

  final Character character;

  Widget _item(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          Text(value.isEmpty ? '-' : value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.fullName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(character.image)),
              _item('Full Name', character.fullName),
              _item('Nickname', character.nickname),
              _item('Hogwarts House', character.hogwartsHouse),
              _item('Interpreted By', character.interpretedBy),
              _item('Birthdate', character.birthdate),
              _item('Children', character.children.join(', ')),
              _item('Index', character.index.toString()),
            ],
          ),
        ),
      ),
    );
  }
}