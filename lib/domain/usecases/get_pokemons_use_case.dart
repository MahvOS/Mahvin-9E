import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<Pokemon>> execute() {
    return repository.getPokemons();
  }
}
