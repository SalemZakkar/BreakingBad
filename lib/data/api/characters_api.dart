import 'dart:convert';

import 'package:breaking_bad/data/strings.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:dio/dio.dart';

String nameApi = "Characters";

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
    } catch(e){
      Messages.errorGetData(nameApi , e.toString());
      return null;
    }
    }
  }
