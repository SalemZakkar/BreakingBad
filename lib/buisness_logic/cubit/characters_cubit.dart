import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/quote_model.dart';

part 'characters_state.dart';

String apiName = "Characters";

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository characterRepository;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());
  void getCharacters() async {
    emit(CharactersIsLoading());
    try{
      final List<Character>? list = await characterRepository.getCharacters();
      emit(CharactersSuccess(list!));
    }catch(e)
    {
      emit(CharactersFail());
    }
  }
  void getQuotes(String id) async {
    emit(QuotesIsLoading());
    try{
      final List<Quote>? list = await characterRepository.getQuotes(id);
      emit(QuotesLoaded(list!));
    }catch(e)
    {
      emit(QuotesError());
    }
  }
}
