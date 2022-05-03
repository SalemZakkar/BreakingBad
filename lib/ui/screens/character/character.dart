import 'package:breaking_bad/buisness_logic/cubit/character_quotes.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/strings.dart';
import 'package:breaking_bad/ui/screens/character/character_data.dart';
import 'package:breaking_bad/ui/widgets/center_error.dart';
import 'package:breaking_bad/ui/widgets/center_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterView extends StatefulWidget {
  final Character character;
  const CharacterView({Key? key , required this.character}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            expandedHeight: size.height*0.9,
            backgroundColor: themeData.primaryColor,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.character.name ?? APPStrings.noData),
               background: CachedNetworkImage(
                 placeholder: (context , string) => const Loading(),
                 errorWidget: (context , string , im) => const ErrorNetworkWidget(),
                 imageUrl: widget.character.img ?? APPStrings.noData,
                 fit: BoxFit.cover,
               ),
               stretchModes: const [
                 StretchMode.blurBackground,
                 StretchMode.fadeTitle,
               ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (_ , index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CharacterInfo(data: widget.character.nickname ?? APPStrings.noData),
                      CharacterInfo(data: widget.character.birthday ?? APPStrings.noData),
                      CharacterInfo(data: widget.character.category ?? APPStrings.noData),
                      CharacterQuotes(name: widget.character.name ?? APPStrings.noData)
                    ],
                  );

                },
              childCount: 1
            ),
          )
        ],

      )
    );
  }
}
