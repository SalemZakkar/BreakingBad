import 'package:breaking_bad/buisness_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:breaking_bad/ui/screens/home/success.dart';
import 'package:breaking_bad/ui/screens/home/theme_button.dart';
import 'package:breaking_bad/ui/widgets/center_error.dart';
import 'package:breaking_bad/ui/widgets/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharactersCubit charactersCubit =
      CharactersCubit(CharactersRepository(CharactersAPI()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BreakingBad Characters",
          textScaleFactor: 1.1,
        ),
        actions: const [ThemeButton()],
      ),
      body: BlocProvider(
        create: (context) {
          charactersCubit.getCharacters();
          return charactersCubit;
        },
        child: OfflineBuilder(
          connectivityBuilder:
              (context, ConnectivityResult connection, Widget child) {
            bool state = connection != ConnectivityResult.none;
            if (state) {
              charactersCubit.getCharacters();
            }
            return BlocBuilder<CharactersCubit, CharactersState>(
                builder: (context, state) {
              if (state is CharactersIsLoading) {
                return const Loading();
              } else if (state is CharactersFail) {
                return const ErrorNetworkWidget();
              } else if (state is CharactersSuccess) {
                return HomeSuccess(
                  characters: state.characters,
                );
              } else {
                return const Center();
              }
            });
          },
          child: const Center(),
        ),
      ),
    );
  }
}
