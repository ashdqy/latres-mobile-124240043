import 'package:get/get.dart';
import '../model/character.dart';
import '../service/api_service.dart';

class CharacterController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxList<Character> _characters = <Character>[].obs;
  final RxBool _isLoading = false.obs;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    _retrieveData();
    super.onInit();
  }

  Future<void> _retrieveData() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.fetchCharacters();
      _characters.assignAll(data);
    } catch (e) {
      Get.log(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}