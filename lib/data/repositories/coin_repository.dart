import 'dart:convert';

import 'package:flutter_structure_v1/data/models/coin_modal.dart';
import 'package:flutter_structure_v1/data/services/core_service.dart';
import 'package:flutter_structure_v1/utils/env_utils.dart';

import '../models/response_http.dart';

class CoinRepository {
  final CoreService coreService;

  CoinRepository({required this.coreService});

  Future<ResponseHttp?> fetchCoinPage(String start, String limit) async {
    try {
      final queryParams = {"start": start, "limit": limit};
      final response =
          await coreService.get(EnvUtils.endPoint_latest, queryParams);

      print("fetchCoinPage response = " + response.body);
      if (response.statusCode == 200) {
        var coinsJson = jsonDecode(response.body);
        final coins = CoinModel.fromJson(coinsJson);
        return ResponseHttp(resData: coins, msg: "Successed");
      } else {
        print("fetchCoinPage error = " + response.body);
        return ResponseHttp(resData: null, msg: response.statusCode.toString());
      }
    } catch (e) {
      print("fetchCoinPage error : " + e.toString());
      throw Exception(e);
    }
    //return throw Exception('Error fetch coin');
  }
}
