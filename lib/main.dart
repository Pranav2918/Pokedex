import 'package:Pokemon_App/bloc/pokemon_bloc.dart';
import 'package:Pokemon_App/bloc/pokemon_event.dart';
import 'package:Pokemon_App/screen/pokedex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)))
      ], child: PokedexView()),
    );
  }
}
