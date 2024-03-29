import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/ui/screens/home/holder.dart';
import 'package:flutter/material.dart';

class HomeSuccess extends StatefulWidget {
  final List<Character> characters;

  const HomeSuccess({Key? key, required this.characters}) : super(key: key);

  @override
  State<HomeSuccess> createState() => _HomeSuccessState();
}

class _HomeSuccessState extends State<HomeSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // double gridRatio = size.height * 0.3 / size.width;
    // ThemeData themeData = Theme.of(context);
    return Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 250),
          itemBuilder: (context, index) {
            return ActorHolder(character: widget.characters[index]);
          },
          itemCount: widget.characters.length,
        ));
  }
}
