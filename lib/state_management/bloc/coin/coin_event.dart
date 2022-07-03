import 'package:flutter/cupertino.dart';

import '../../../data/models/coin_modal.dart';

abstract class CoinEvent {}

class CoinEventLoading extends CoinEvent {
  final bool isDefaultPage;
  CoinEventLoading({required this.isDefaultPage});
}

class CoinEventFetchData extends CoinEvent {
  final List<Data> dataList;
  final isLoading;
  CoinEventFetchData({required this.dataList, required this.isLoading});
}

class CoinEventError extends CoinEvent {
  final String error;
  CoinEventError({required this.error});
}
