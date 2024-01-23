import 'dart:developer';

import 'package:cat_trivia_app/features/data/model/facts_info_model.dart';
import 'package:dio/dio.dart';

class FactServices {
  final _dio = Dio();

  Future<CatFactsInfoModel> getFacts() async {
    final response =
        await _dio.get("https://cat-fact.herokuapp.com/facts/random");
    log("COME RESPONSE DATA>>>> ${response.data}");
    return CatFactsInfoModel.fromMap(response.data);
  }
}
