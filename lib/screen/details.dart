import 'dart:ui';

import 'package:Pokemon_App/bloc/pokemondetails_cubit.dart';
import 'package:Pokemon_App/data/pokemon_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
        builder: (context, details) {
          return details != null
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 35, right: 35, top: 120),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 2.5,
                          top: 70),
                      height: 90,
                      width: 90,
                      child: Image.network(
                        details.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 2.5,
                          top: 150),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: details.types
                            .map((type) => _pokemonTypeView(type))
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          margin: EdgeInsets.only(top: 270, left: 55),
                          child: Center(
                            child: Text(
                                'Weight ${details.weight} KG'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          margin: EdgeInsets.only(top: 270, right: 55),
                          child: Center(
                            child: Text('Id ${details.id}'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 35, right: 35, top: 340),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Description :',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.left)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              details.description,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget _pokemonTypeView(String type) {
  Color color;

  switch (type) {
    case 'normal':
      color = Color(0xFFbdbeb0);
      break;
    case 'poison':
      color = Color(0xFF995E98);
      break;
    case 'psychic':
      color = Color(0xFFE96EB0);
      break;
    case 'grass':
      color = Color(0xFF9CD363);
      break;
    case 'ground':
      color = Color(0xFFE3C969);
      break;
    case 'ice':
      color = Color(0xFFAFF4FD);
      break;
    case 'fire':
      color = Color(0xFFE7614D);
      break;
    case 'rock':
      color = Color(0xFFCBBD7C);
      break;
    case 'dragon':
      color = Color(0xFF8475F7);
      break;
    case 'water':
      color = Color(0xFF6DACF8);
      break;
    case 'bug':
      color = Color(0xFFC5D24A);
      break;
    case 'dark':
      color = Color(0xFF886958);
      break;
    case 'fighting':
      color = Color(0xFF9E5A4A);
      break;
    case 'ghost':
      color = Color(0xFF7774CF);
      break;
    case 'steel':
      color = Color(0xFFC3C3D9);
      break;
    case 'flying':
      color = Color(0xFF81A2F8);
      break;
    case 'normal':
      color = Color(0xFFF9E65E);
      break;
    case 'fairy':
      color = Color(0xFFEEB0FA);
      break;
    default:
      color = Colors.black;
      break;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
