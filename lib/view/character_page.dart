import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/character_controller.dart';
import '../service/auth_service.dart';
//import 'character_detail_page.dart';
import 'spell_page.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({super.key});

  final CharacterController controller = Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Characters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: AuthService.logout,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final character = controller.characters[index];
            return Card(
              child: ListTile(
                leading: SizedBox(
                  width: 40,
                  child: Image.network(character.image, fit: BoxFit.cover),
                ),
                title: Text(character.fullName),
                subtitle: Text(character.interpretedBy),
                // onTap: () {
                //   Get.to(() => CharacterDetailPage(character: character));
                // },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () => Get.off(() => SpellPage()),
            child: const Text('Spells'),
          ),
        ),
      ),
    );
  }
}