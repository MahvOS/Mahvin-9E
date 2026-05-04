import 'package:flutter/material.dart';

import '../../domain/entities/pokemon.dart';
import '../../core/pokemon_theme.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final primaryColor = PokemonTheme.getTypeColor(pokemon.types.first);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(child: _buildContentCard()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: pokemon.types.map((type) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )).toList(),
          ),
          Center(
            child: Hero(
              tag: 'pokemon-${pokemon.id}',
              child: Image.asset(
                pokemon.imageUrl,
                height: 260,
                width: 260,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.red,
              tabs: [
                Tab(text: 'Tentang'),
                Tab(text: 'Stats'),
                Tab(text: 'Sinergi'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAboutTab(),
                  _buildStatsTab(),
                  _buildSynergyTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(pokemon.description, style: const TextStyle(color: Colors.black87, height: 1.5)),
          const SizedBox(height: 20),
          const Text('Ability', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(pokemon.ability),
          const SizedBox(height: 20),
          const Text('Role', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(pokemon.role),
          const SizedBox(height: 20),
          const Text('Weakness', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: pokemon.weaknesses.map((w) => Chip(label: Text(w))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildStatRow('HP', pokemon.hp, 200),
          _buildStatRow('Attack', pokemon.atk, 200),
          _buildStatRow('Defense', pokemon.def, 200),
          _buildStatRow('Sp. Atk', pokemon.spAtk, 200),
          _buildStatRow('Sp. Def', pokemon.spDef, 200),
          _buildStatRow('Speed', pokemon.speed, 200),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value, double max) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(color: Colors.grey))),
          SizedBox(width: 40, child: Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: LinearProgressIndicator(
              value: value / max,
              backgroundColor: Colors.grey.shade200,
              color: value > 100 ? Colors.green : (value > 60 ? Colors.orange : Colors.red),
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSynergyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Partner Cocok', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          ...pokemon.suitablePartners.map((partner) => ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.handshake, color: Colors.white, size: 20),
            ),
            title: Text(partner),
            subtitle: const Text('Memberikan sinergi serangan/pertahanan'),
          )).toList(),
        ],
      ),
    );
  }
}
