import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.types,
    required super.hp,
    required super.atk,
    required super.def,
    required super.spAtk,
    required super.spDef,
    required super.speed,
    required super.ability,
    required super.weaknesses,
    required super.description,
    required super.role,
    required super.suitablePartners,
    required super.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: List<String>.from(json['types']),
      hp: json['stats']['hp'],
      atk: json['stats']['atk'],
      def: json['stats']['def'],
      spAtk: json['stats']['spAtk'],
      spDef: json['stats']['spDef'],
      speed: json['stats']['speed'],
      ability: json['ability'],
      weaknesses: List<String>.from(json['weaknesses']),
      description: json['description'],
      role: json['role'],
      suitablePartners: List<String>.from(json['suitablePartners']),
      imageUrl: json['imageUrl'],
    );
  }
}
