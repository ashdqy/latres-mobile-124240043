class Character {
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final List<dynamic> children;
  final String image;
  final String birthdate;
  final int index;

  Character({
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
    required this.index,
  });

  factory Character.fromJson(Map<String, dynamic> jsonData) {
    return Character(
      fullName: jsonData['fullName'] ?? '',
      nickname: jsonData['nickname'] ?? '',
      hogwartsHouse: jsonData['hogwartsHouse'] ?? '',
      interpretedBy: jsonData['interpretedBy'] ?? '',
      children: jsonData['children'] ?? [],
      image: jsonData['image'] ?? '',
      birthdate: jsonData['birthdate'] ?? '',
      index: jsonData['index'] ?? 0,
    );
  }
}