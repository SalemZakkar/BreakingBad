import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:dio/dio.dart';

String nameApi = "Characters";
String nameApi2 = "Quotes";

class CharactersAPI {
  late Dio dio;

  CharactersAPI() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: APPStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<Response?> getCharacters() async {
    Messages.getData(nameApi);
    try {
      Response response = await dio.get(APPStrings.charactersUrl);
      Messages.successGetData(nameApi);
      return response;
    } catch (e) {
      Messages.errorGetData(nameApi, e.toString());
      return null;
    }
  }

  Future<Response?> getQuotes(String name) async {
    String sName = name.replaceAll(RegExp("\\s+"), "+");
    Messages.getData(nameApi2);
    try {
      Response response = await dio.get(APPStrings.quotesUrl + sName);
      Messages.successGetData(nameApi2);
      return response;
    } catch (e) {
      Messages.errorGetData(nameApi2, e.toString());
      return null;
    }
  }
}
