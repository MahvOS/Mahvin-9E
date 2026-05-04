import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokemon_provider.dart';
import '../../domain/entities/pokemon.dart';
import '../../core/pokemon_theme.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildFilters(context),
          _buildPokemonGrid(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: Colors.red.shade700,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              right: -50,
              top: -50,
              child: Opacity(
                opacity: 0.1,
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PokéLite',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Temukan Pokémon favoritmu!',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (v) => context.read<PokemonProvider>().search(v),
                    decoration: InputDecoration(
                      hintText: 'Cari Nama Pokémon...',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          final types = provider.allTypes;
          return Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: types.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final type = types[index];
                final isSelected = provider.selectedType == type;
                return FilterChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (_) => provider.filterByType(type),
                  selectedColor: Colors.red.shade100,
                  checkmarkColor: Colors.red,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.red : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildPokemonGrid(BuildContext context) {
    return Consumer<PokemonProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (provider.pokemons.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text('Pokémon tidak ditemukan')),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final pokemon = provider.pokemons[index];
                return _PokemonCard(pokemon: pokemon);
              },
              childCount: provider.pokemons.length,
            ),
          ),
        );
      },
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final primaryTypeColor = PokemonTheme.getTypeColor(pokemon.types.first);
    
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(pokemon: pokemon)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryTypeColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryTypeColor.withOpacity(0.3)),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Opacity(
                opacity: 0.1,
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryTypeColor.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    children: pokemon.types.map((type) => _TypeBadge(type: type)).toList(),
                  ),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 8),
                      child: Hero(
                        tag: 'pokemon-${pokemon.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            pokemon.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String type;
  const _TypeBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    final color = PokemonTheme.getTypeColor(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
