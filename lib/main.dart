import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/repositories/pokemon_repository_impl.dart';
import 'domain/usecases/get_pokemons_use_case.dart';
import 'presentation/providers/pokemon_provider.dart';
import 'presentation/pages/home_page.dart';
import 'core/pokemon_theme.dart';

void main() {
  runApp(const PokeLiteApp());
}

class PokeLiteApp extends StatelessWidget {
  const PokeLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonProvider(
            GetPokemonsUseCase(PokemonRepositoryImpl()),
          )..fetchPokemons(),
        ),
      ],
      child: MaterialApp(
        title: 'PokéLite',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          textTheme: GoogleFonts.outfitTextTheme(),
        ),
        home: const HomePage(),
      ),
    );
  }
}
