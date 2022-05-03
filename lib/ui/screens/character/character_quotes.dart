import 'package:breaking_bad/buisness_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/models/quote_model.dart';
import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:breaking_bad/ui/widgets/center_error.dart';
import 'package:breaking_bad/ui/widgets/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharacterQuotes extends StatefulWidget {
  final String name;

  const CharacterQuotes({Key? key, required this.name}) : super(key: key);

  @override
  State<CharacterQuotes> createState() => _CharacterQuotesState();
}

class _CharacterQuotesState extends State<CharacterQuotes> {
  List<Widget> texts = [];
  List<int> indices = [];
  int cnt = 0;
  CharactersCubit charactersCubit =
      CharactersCubit(CharactersRepository(CharactersAPI()));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        return charactersCubit;
      },
      child: OfflineBuilder(
        connectivityBuilder: (_, connection, child) {
          bool state = connection != ConnectivityResult.none;
          if (state) {
            charactersCubit.getQuotes(widget.name);
            return BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is QuotesIsLoading) {
                  return const Loading();
                } else if (state is QuotesError) {
                  return const ErrorNetworkWidget();
                } else if (state is QuotesLoaded) {
                  List<Quote> quotes = state.quotes;
                  // ignore: avoid_function_literals_in_foreach_calls
                  texts.clear();
                  quotes.forEach((element) {
                    String myName = widget.name;
                    String fetchedName = element.author ?? "n/a";
                    if (myName == fetchedName) {
                      texts.add(quoteText(element.quote ?? " ",
                          themeData.textTheme.bodyText1!.color!, ++cnt));
                    }
                  });
                }
                if (texts.isEmpty) {
                  texts.add(Container(
                    width: size.width * 0.9,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.do_not_disturb,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ));
                }
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: themeData.cardColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: texts),
                  ),
                );
              },
            );
          } else {
            return const ErrorNetworkWidget();
          }
        },
        child: const Text(""),
      ),
    );
  }
}

Widget quoteText(String text, Color color, int index) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Text(
      index.toString() + ".   " + text,
      textScaleFactor: 1,
      style: TextStyle(color: color),
    ),
  );
}
