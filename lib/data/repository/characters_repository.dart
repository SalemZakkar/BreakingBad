
import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/models/character_model.dart';

class CharactersRepository {
  final CharactersAPI charactersApi;
  CharactersRepository(this.charactersApi);
  Future<List<Character>?> getCharacters() async {
    final response = await charactersApi.getCharacters();
    if(response != null) {
      final data = response.data as List<dynamic>;
      return data.map((e) => Character.fromJson(e)).toList();
    }
    return null;
    
  }
}