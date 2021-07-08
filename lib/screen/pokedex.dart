import 'package:Pokemon_App/bloc/nav_cubit.dart';
import 'package:Pokemon_App/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.pokemonListings.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:()=>BlocProvider.of<NavCubit>(context).showPokemonDetails(state.pokemonListings[index].id),
                  child: Card(
                    color: Colors.black,
                    elevation: 5.0,
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(
                            state.pokemonListings[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            state.pokemonListings[index].name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                color: (index % 2 == 0)
                                    ? Colors.red[600]
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
