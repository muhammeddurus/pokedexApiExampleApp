import 'package:flutter/material.dart';
import 'package:pokedex_application/models/pokedex_test.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetay extends StatefulWidget {
  late Pokemon pokemon;

  PokemonDetay(this.pokemon);

  @override
  _PokemonDetayState createState() => _PokemonDetayState();
}

class _PokemonDetayState extends State<PokemonDetay> {
  Color appbarRengi = Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.pokemon.img.toString()));
    appbarRengi = _generator.dominantColor!.color;
    setState(() {});
    print(appbarRengi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbarRengi,
        appBar: AppBar(
          backgroundColor: appbarRengi,
          elevation: 0,
          title: Text(
            widget.pokemon.name.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        }));
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * 3 / 4,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: widget.pokemon.img.toString(),
              child: Container(
                width: 200,
                child: Image.network(
                  widget.pokemon.img.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.pokemon.name.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height :" + widget.pokemon.height.toString(),
                  ),
                  Text(
                    "Weight :" + widget.pokemon.weight.toString(),
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type!
                        .map(
                          (tip) => Chip(
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.deepOrange.shade300,
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution!
                            .map(
                              (evolution) => Chip(
                                label: Text(
                                  evolution.name.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.deepOrange.shade300,
                              ),
                            )
                            .toList()
                        : [Text("İlk Hali")],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution!
                            .map(
                              (evolution) => Chip(
                                label: Text(
                                  evolution.name.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.deepOrange.shade300,
                              ),
                            )
                            .toList()
                        : [Text("Son Hali")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses!
                            .map(
                              (weak) => Chip(
                                label: Text(
                                  weak.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.deepOrange.shade300,
                              ),
                            )
                            .toList()
                        : [Text("Zayıflığı Yok")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  widget.pokemon.name.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height :" + widget.pokemon.height.toString(),
                ),
                Text(
                  "Weight :" + widget.pokemon.weight.toString(),
                ),
                Text(
                  "Types",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type!
                      .map(
                        (tip) => Chip(
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.deepOrange.shade300,
                        ),
                      )
                      .toList(),
                ),
                Text(
                  "Pre Evolution",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.prevEvolution != null
                      ? widget.pokemon.prevEvolution!
                          .map(
                            (evolution) => Chip(
                              label: Text(
                                evolution.name.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.deepOrange.shade300,
                            ),
                          )
                          .toList()
                      : [Text("İlk Hali")],
                ),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.nextEvolution != null
                      ? widget.pokemon.nextEvolution!
                          .map(
                            (evolution) => Chip(
                              label: Text(
                                evolution.name.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.deepOrange.shade300,
                            ),
                          )
                          .toList()
                      : [Text("Son Hali")],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.weaknesses != null
                      ? widget.pokemon.weaknesses!
                          .map(
                            (weak) => Chip(
                              label: Text(
                                weak.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.deepOrange.shade300,
                            ),
                          )
                          .toList()
                      : [Text("Zayıflığı Yok")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: widget.pokemon.img.toString(),
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  widget.pokemon.img.toString(),
                  fit: BoxFit.contain,
                ),
              )),
        ),
      ],
    );
  }
}
