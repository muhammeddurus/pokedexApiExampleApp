import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_application/models/pokedex_test.dart';

import 'pokemon_detay.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Uri url = Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

  late Welcome pokedex;
  late Future<Welcome> veri;

  Future<Welcome> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    pokedex = Welcome.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return FutureBuilder(
                future: veri, //Geriye Future döndürecek nesne
                builder: (context, AsyncSnapshot<Welcome> gelenPokedex) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: gelenPokedex.data!.pokemon!.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetay(poke)));
                        },
                        child: Hero(
                            tag: poke.img.toString(),
                            child: Card(
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 116,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/images/load.gif",
                                      image: poke.img.toString(),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    poke.name.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );
                });
          } else {
            return FutureBuilder(
                future: veri, //Geriye Future döndürecek nesne
                builder: (context, AsyncSnapshot<Welcome> gelenPokedex) {
                  return GridView.extent(
                    maxCrossAxisExtent: 300,
                    children: gelenPokedex.data!.pokemon!.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetay(poke)));
                        },
                        child: Hero(
                            tag: poke.img.toString(),
                            child: Card(
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/images/load.gif",
                                      image: poke.img.toString(),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    poke.name.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );
                });
          }
        },
      ),
    );
  }
}
