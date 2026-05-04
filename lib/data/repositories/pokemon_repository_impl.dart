import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/local_data_source.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemons() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return LocalDataSource.getPokemons();
  }
}
