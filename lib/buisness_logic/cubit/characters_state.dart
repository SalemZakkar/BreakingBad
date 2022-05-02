part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;
  CharactersSuccess(this.characters);
}
class CharactersFail extends CharactersState {
  CharactersFail();
}
class CharactersIsLoading extends CharactersState {
  CharactersIsLoading();
}


