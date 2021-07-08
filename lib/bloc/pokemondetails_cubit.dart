import 'package:Pokemon_App/data/pokemon_details.dart';
import 'package:Pokemon_App/data/pokemon_info.dart';
import 'package:Pokemon_App/data/selected_info.dart';
import 'package:Pokemon_App/repository/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepository();
  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getSelectedPokemonInfo(pokemonId)
    ]);

    final pokemonInfo = response[0] as PokemonInfoResponse;
    final selectedInfo = response[1] as SelectedPokemonInfo;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: selectedInfo.description));
  }

  void clearPokemonDetails() {
    emit(null);
  }
}
