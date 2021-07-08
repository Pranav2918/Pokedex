import 'package:flutter/material.dart';

class SelectedPokemonInfo {
  final String description;

  SelectedPokemonInfo({@required this.description});

  factory SelectedPokemonInfo.fromJson(Map<String, dynamic> json) {
    return SelectedPokemonInfo(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}
