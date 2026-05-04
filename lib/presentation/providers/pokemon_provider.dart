import 'package:flutter/material.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemons_use_case.dart';

class PokemonProvider extends ChangeNotifier {
  final GetPokemonsUseCase getPokemonsUseCase;

  PokemonProvider(this.getPokemonsUseCase);

  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];
  bool _isLoading = false;
  String _searchQuery = "";
  String _selectedType = "All";

  List<Pokemon> get pokemons => _filteredPokemons;
  bool get isLoading => _isLoading;
  String get selectedType => _selectedType;

  Future<void> fetchPokemons() async {
    _isLoading = true;
    notifyListeners();
    try {
      _allPokemons = await getPokemonsUseCase.execute();
      _applyFilters();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void filterByType(String type) {
    _selectedType = type;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredPokemons = _allPokemons.where((pokemon) {
      final matchesSearch = pokemon.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesType = _selectedType == "All" || pokemon.types.contains(_selectedType);
      return matchesSearch && matchesType;
    }).toList();
    notifyListeners();
  }

  List<String> get allTypes {
    final types = _allPokemons.expand((p) => p.types).toSet().toList();
    types.sort();
    return ["All", ...types];
  }
}
