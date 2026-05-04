class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final int hp;
  final int atk;
  final int def;
  final int spAtk;
  final int spDef;
  final int speed;
  final String ability;
  final List<String> weaknesses;
  final String description;
  final String role;
  final List<String> suitablePartners;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.hp,
    required this.atk,
    required this.def,
    required this.spAtk,
    required this.spDef,
    required this.speed,
    required this.ability,
    required this.weaknesses,
    required this.description,
    required this.role,
    required this.suitablePartners,
    required this.imageUrl,
  });

  double get averageStat => (hp + atk + def + spAtk + spDef + speed) / 6;
}
