import 'package:flutter/cupertino.dart';
import 'package:flutter_structure_v1/data/models/coin_modal.dart';

@immutable
abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {}

class CoinFetchData extends CoinState {
  final List<Data> dataList;
  final bool isLoading;
  CoinFetchData({required this.dataList, required this.isLoading});
}

class CoinError extends CoinState {
  final String error;
  CoinError({required this.error});
}
