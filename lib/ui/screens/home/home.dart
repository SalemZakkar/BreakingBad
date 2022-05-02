import 'package:breaking_bad/buisness_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:breaking_bad/ui/screens/home/success.dart';
import 'package:breaking_bad/ui/screens/home/theme_button.dart';
import 'package:breaking_bad/ui/widgets/center_error.dart';
import 'package:breaking_bad/ui/widgets/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BreakingBad Characters",
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        ),
        actions: const [
           ThemeButton()
        ],
      ),
      body: BlocProvider(
        create: (context) {
          CharactersCubit charactersCubit = CharactersCubit(CharactersRepository(CharactersAPI()));
          charactersCubit.getCharacters();
         return charactersCubit;
        },
        child: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
          if (state is CharactersIsLoading) {
            return const Loading();
          } else if (state is CharactersFail) {
            return const ErrorNetworkWidget();
          } else if(state is CharactersSuccess){
            return  HomeSuccess(characters: state.characters,);
          }
          else {
            return const Center();
          }
        }),
      ),
    );
  }
}
